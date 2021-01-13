# Bicep - PowerShell Module
This is the repo for the Bicep PowerShell Module. The module is created as a wrapper for the [Bicep CLI](https://github.com/Azure/bicep). It started with a simple function to enable compilation of all bicep files in a folder, but I came up with additional use cases and the Bicep Module was born.

Commands implemented:
- Invoke-BicepBuild
- ConvertTo-Bicep
- Get-BicepVersion
- Install-BicepCLI
- Update-BicepCLI

## Instructions

### Invoke-BicepBuild
`Invoke-BicepBuild` is equivalent to `bicep build` but with the possibility to compile all `.bicep` files in a directory.

#### Examples

#### 1. Compile single bicep file in working directory
`Invoke-BicepBuild vnet.bicep`

#### 2. Compile single bicep file in different directory
`Invoke-BicepBuild 'c:\bicep\modules\vnet.bicep'`

#### 3. Compile all .bicep files in working directory
`Invoke-BicepBuild`

#### 4. Compile all .bicep files in different directory
`Invoke-BicepBuild -Path 'c:\bicep\modules\'`

Or:

`Invoke-BicepBuild 'c:\bicep\modules\'`

### ConvertTo-Bicep
`ConvertTo-Bicep` is equivalent to `bicep decompile` but with the possibility to decompile all `.bicep` files in a directory.

#### Examples

#### 1. Decompile single .json file in working directory
`ConvertTo-Bicep vnet.json`

#### 2. Decompile single .json file in different directory
`ConvertTo-Bicep 'c:\armtemplates\vnet.json'`

#### 3. Decompile all .json files in working directory
`ConvertTo-Bicep`

#### 4. Decompile all .json files in different directory
`ConvertTo-Bicep -Path 'c:\armtemplates\'`

Or:

`Invoke-BicepBuild 'c:\armtemplates\'`

### Get-BicepVersion
`Get-BicepVersion` is a command to compare the installed version of Bicep CLI with the latest realease available in the Azure/Bicep repo.

#### Examples

#### 1. Compare installed version with latest release
```
Get-BicepVersion

InstalledVersion LatestVersion
---------------- -------------
0.2.212          0.2.212
```

### Install-BicepCLI
`Install-BicepCLI` is a command to to install the latest Bicep CLI realease available from the Azure/Bicep repo.

#### Examples

#### 1. Install Bicep CLI
`Install-BicepCLI`

#### 2. Install Bicep CLI using force
`Install-BicepCLI -Force`


### Update-BicepCLI
`Update-BicepCLI` is a command to update Bicep CLI to the latest realease available from the Azure/Bicep repo.

#### Examples

#### 1. Update Bicep CLI
`Update-BicepCLI`

## Contribution
No contribution guidelines have been written yet, but contributions are welcome. Check the project board if any cards don't have an assignee and are up for grabs. Create issues for feature requests.