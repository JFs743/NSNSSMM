# NSNSSMCM

Non-Sucking "Non-Sucking Service Manager" Configuration Manager

Because NSSM kinda sucks, actually

## Preamble

This script is a wrapper for the good ol' nssm.exe and actually requires it. I found it very silly to have to open the cmd, then run a command just to open a GUI (`nssm install <ServiceName>`).
Running multiple commands with `nssm set <ServiceName> option value` isn't much better.

In my job, I find myself doing lots of service installs with similar configs and having to manually enter the same values over and over.
That's why I decided to make a tool to make installs more repeatable.

## Important note

NSNSSMCM assumes a simple, predictable structure:

- `nssm.exe`, `nsnssmcm.ps1`, and your service folders live under a common root (e.g. `C:\InstalledServices\`)
- Each service has its own folder named after the service
- Each service folder contains a `nsnssmcm.json` file

Example:

```plaintext
C:\InstalledServices\
   ├─ nssm.exe
   ├─ nsnssmcm.ps1
   ├─ MyService\
   │  ├─ nsnssmcm.json
   │  └─ (app files here)
   └─ AnotherService\
      ├─ nsnssmcm.json
      └─ (...)
```

This structure is opinionated, but it keeps things reproducible and predictable.
You can deviate — just don’t expect sympathy.

Each `nsnssmcm.json` normally holds a single service object, as above. It can also hold an **array** of service objects instead, for a multi-service deployment that shares one folder (e.g. a small stack of related services installed and versioned together):

```json
[
    {
        "Application": "C:\\Program Files\\nodejs\\node.exe",
        "AppParameters": "api.js",
        "AppDirectory": "C:\\InstalledServices\\MyStack",
        "DisplayName": "MyStack-Api",
        "ObjectName": "LocalSystem",
        "Name": "MyStack-Api",
        "Start": "SERVICE_AUTO_START",
        "Type": "SERVICE_WIN32_OWN_PROCESS"
    },
    {
        "Application": "C:\\Program Files\\nodejs\\node.exe",
        "AppParameters": "worker.js",
        "AppDirectory": "C:\\InstalledServices\\MyStack",
        "DisplayName": "MyStack-Worker",
        "ObjectName": "LocalSystem",
        "Name": "MyStack-Worker",
        "Start": "SERVICE_AUTO_START",
        "Type": "SERVICE_WIN32_OWN_PROCESS"
    }
]
```

`-Import`, `-Reset`, and `-Export` all understand this: importing/resetting a folder whose `nsnssmcm.json` is an array creates/removes/recreates every service listed in it, and exporting a service into a folder that already has other services recorded there merges in rather than overwriting them.

## Recommended setup

### Scenario 1: Creating a Service From Scratch (No Template)

If the service does not exist yet:

1. Create a folder named after your future service.
2. Place your application files inside (if applicable).
3. Run:

   `.\nsnssmcm.ps1 -New -ServiceName "MyService" -ApplicationPath "C:\Path\To\App.exe" -AppParameters "-arg1 -arg2"`

This will:

- Install the service via NSSM
- Export its configuration to `./MyService/nsnssmcm.json`
- Start the service

After this point, the JSON file becomes the source of truth.

You can now version-control it, copy it, or replicate it elsewhere.

### Scenario 2: Using an Existing Template (Recommended)

If you already have a working `nsnssmcm.json`:

1. Create a folder named after the service.
2. Drop the `nsnssmcm.json` file inside.
3. Run:

   `.\nsnssmcm.ps1 -Import "MyService"`

This will:

- Create the service if it doesn’t exist
- Apply all stored settings
- Start the service

To fully rebuild from config:

   `.\nsnssmcm.ps1 -Reset "MyService"`

This removes and recreates the service from the JSON definition.

---

### Scenario 3: Exporting Existing Services

If you created a service manually (using the GUI or CLI), you can bring it under NSNSSMCM's control:

   `.\nsnssmcm.ps1 -Export "MyService"`

This generates a `nsnssmcm.json` for an existing NSSM-managed service.

Once exported, the configuration becomes portable and reproducible.

---

### Scenario 4: Multi-Service Deployments

If several services belong together (an API and its worker, an app and a companion process, etc.), they can share one folder and one `nsnssmcm.json` containing an array of service objects (see the example above).

   `.\nsnssmcm.ps1 -Import "MyStack"`

This will create/apply/start every service defined in the array, in order.

   `.\nsnssmcm.ps1 -Reset "MyStack"`

This removes and recreates every service in the array from the JSON definition.

## Philosophy

The GUI is a bootstrap tool.
The JSON file is the truth.
The script is the enforcement layer.

If something changes, change the JSON.
If you want to be certain, use `-Reset`.

Clicking through dialogs repeatedly is not a deployment strategy.

## Special request

Someone please make a GUI wrapper and call it NSNSNSSMCMM.
