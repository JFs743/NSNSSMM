@{
    IncludeRules = @(
        # Formatting
        'PSAvoidTrailingWhitespace',
        'PSMisleadingBacktick',
        'PSPlaceOpenBrace',
        'PSPlaceCloseBrace',
        'PSUseConsistentWhitespace',
        'PSUseConsistentIndentation',
        'PSAlignAssignmentStatement',
        'PSUseCorrectCasing',
        'PSAvoidLongLines',
        'PSAvoidSemicolonsAsLineTerminators',
        'PSUseBOMForUnicodeEncodedFile',

        # Variables
        'PSAvoidAssignmentToAutomaticVariable',
        'PSAvoidMultipleTypeAttributes',
        'PSAvoidNullOrEmptyHelpMessageAttribute',
        'PSAvoidUsingComputerNameHardcoded',
        'PSAvoidUsingConvertToSecureStringWithPlainText',
        'PSAvoidUsingPlainTextForPassword',
        'PSAvoidUsingPositionalParameters',
        'PSReservedParams',
        'PSReviewUnusedParameter',
        'PSUseDeclaredVarsMoreThanAssignments',
        'PSUseLiteralInitializerForHashtable',
        'PSUsePSCredentialType',
        'PSAvoidUsingDoubleQuotesForConstantString',

        # CmdLets
        'PSAvoidOverwritingBuiltInCmdlets',
        'PSAvoidUsingCmdletAliases',
        'PSReservedCmdletChar',
        'PSUseApprovedVerbs',
        'PSUseCmdletCorrectly',

        # Others
        'PSAvoidUsingEmptyCatchBlock',
        'PSPossibleIncorrectComparisonWithNull',
        'PSPossibleIncorrectUsageOfAssignmentOperator',
        'PSPossibleIncorrectUsageOfRedirectionOperator',
        'PSProvideCommentHelp',
        'PSUseCompatibleSyntax',
        'PSUseOutputTypeCorrectly'
    )

    Rules        = @{

        # Formatting
        PSAvoidTrailingWhitespace                      = @{
            Enable = $true
        }

        PSMisleadingBacktick                           = @{
            Enable = $true
        }

        PSPlaceOpenBrace                               = @{
            Enable             = $true
            OnSameLine         = $true
            NewLineAfter       = $true
            IgnoreOneLineBlock = $true
        }

        PSPlaceCloseBrace                              = @{
            Enable             = $true
            NewLineAfter       = $false
            IgnoreOneLineBlock = $true
            NoEmptyLineBefore  = $true
        }

        PSUseConsistentIndentation                     = @{
            Enable              = $true
            Kind                = 'space'
            PipelineIndentation = 'IncreaseIndentationAfterEveryPipeline'
            IndentationSize     = 4
        }

        PSUseConsistentWhitespace                      = @{
            Enable                                  = $true
            CheckInnerBrace                         = $true
            CheckOpenBrace                          = $true
            CheckOpenParen                          = $true
            CheckOperator                           = $true
            CheckPipe                               = $true
            CheckPipeForRedundantWhitespace         = $true
            CheckSeparator                          = $true
            CheckParameter                          = $true
            IgnoreAssignmentOperatorInsideHashTable = $true
        }

        PSAlignAssignmentStatement                     = @{
            Enable         = $true
            CheckHashtable = $true
        }

        PSUseCorrectCasing                             = @{
            Enable = $true
        }

        PSAvoidLongLines                               = @{
            Enable            = $true
            MaximumLineLength = 115
        }

        PSAvoidSemicolonsAsLineTerminators             = @{
            Enable = $true
        }

        PSAvoidUsingPositionalParameters               = @{
            Enable = $true
        }

        PSUseBOMForUnicodeEncodedFile                  = @{
            Enable = $true
        }

        # Variables
        PSAvoidAssignmentToAutomaticVariable           = @{
            Enable = $true
        }

        PSAvoidMultipleTypeAttributes                  = @{
            Enable = $true
        }

        PSAvoidNullOrEmptyHelpMessageAttribute         = @{
            Enable = $true
        }

        PSAvoidUsingComputerNameHardcoded              = @{
            Enable = $true
        }

        PSAvoidUsingConvertToSecureStringWithPlainText = @{
            Enable = $true
        }

        PSAvoidUsingPlainTextForPassword               = @{
            Enable = $true
        }

        PSReservedParams                               = @{
            Enable = $true
        }

        PSReviewUnusedParameter                        = @{
            Enable = $true
        }

        PSUseDeclaredVarsMoreThanAssignments           = @{
            Enable = $true
        }

        PSUseLiteralInitializerForHashtable            = @{
            Enable = $true
        }

        PSUsePSCredentialType                          = @{
            Enable = $true
        }

        PSAvoidUsingDoubleQuotesForConstantString      = @{
            Enable = $true
        }

        # CmdLets
        PSAvoidOverwritingBuiltInCmdlets               = @{
            Enable            = $true
            PowerShellVersion = @(
                'desktop-5.1.14393.206-windows',
                'core-6.1.0-windows'
            )
        }

        PSAvoidUsingCmdletAliases                      = @{
            Enable    = $true
            allowlist = @()
        }

        PSReservedCmdletChar                           = @{
            Enable = $true
        }

        PSUseApprovedVerbs                             = @{
            Enable = $true
        }

        PSUseCmdletCorrectly                           = @{
            Enable = $true
        }

        # Others
        PSAvoidUsingEmptyCatchBlock                    = @{
            Enable = $true
        }

        PSPossibleIncorrectComparisonWithNull          = @{
            Enable = $true
        }

        PSPossibleIncorrectUsageOfAssignmentOperator   = @{
            Enable = $true
        }

        PSPossibleIncorrectUsageOfRedirectionOperator  = @{
            Enable = $true
        }

        PSProvideCommentHelp                           = @{
            Enable                  = $true
            ExportedOnly            = $false
            BlockComment            = $true
            VSCodeSnippetCorrection = $true
            Placement               = 'begin'
        }

        PSUseCompatibleSyntax                          = @{
            Enable         = $true
            TargetVersions = @(
                '7.0',
                '6.0',
                '5.1'
            )
        }

        PSUseOutputTypeCorrectly                       = @{
            Enable = $true
        }
    }
}
