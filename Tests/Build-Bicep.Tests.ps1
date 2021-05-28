try {
    $ScriptDirectory = Split-Path -Path $PSCommandPath -Parent
    Import-Module -FullyQualifiedName "$ScriptDirectory\..\Source\Bicep.psd1"
    Write-Host "fis $ScriptDirectory"
}
catch {
    Throw "Unable to import Bicep module. $_"
}

InModuleScope Bicep {
    BeforeAll {
        $ScriptDirectory = Split-Path -Path $PSCommandPath -Parent
    }
    Describe 'Build-Bicep' {
        
        Context 'When it works' {            
            BeforeAll {
                $armTemplate = Build-Bicep -Path "$ScriptDirectory\supportFiles\workingBicep.bicep" -AsString
            }
            It 'Build a bicep file' {
                $armTemplate | Should -Not -BeNullOrEmpty
            }
        }
        Context 'When it does not work' { 
            It 'Does not generate ARM template' {
                Build-Bicep -Path "$ScriptDirectory\supportFiles\brokenBicep.bicep" -AsString -IgnoreDiagnostics | Should -BeNullOrEmpty
            }

            It 'Diagnostics' {
                Build-Bicep -Path "$ScriptDirectory\supportFiles\brokenBicep.bicep" -AsString 6>&1 -ErrorAction SilentlyContinue | Should -BeLike '*Error BCP018: Expected the "}" character at this location.'
            }

            
        }
    }
}