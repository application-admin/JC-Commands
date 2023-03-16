#### Name

Windows - queryAllSystems | v1.0

#### commandType

windows

#### Command

```
$FileLocation = "C:\Temp\"
$allSystems = Get-JcSdkSystem
foreach ($system in $allSystems)
{
    # Get App List for each system
    if ($system.OS -eq 'Windows')
    {
        $programs = Get-JCSystemInsights -Table Program -SystemId $system.Id | ConvertTo-CSV
        Out-File -FilePath $PSScriptRoot/$($system.hostname).csv -InputObject $programs
    }
    if ($system.OS -eq 'Mac OS X')
    {
        $apps = Get-JCSystemInsights -Table App -SystemId $system.id | ConvertTo-CSV
        Out-File -FilePath $FileLocation/$($system.hostname).csv -InputObject $apps
    }
}
```

#### Description

Create A file for each known system containing the installed software

#### *Import This Command*

To import this command into your JumpCloud tenant run the below command using the [JumpCloud PowerShell Module](https://github.com/TheJumpCloud/support/wiki/Installing-the-JumpCloud-PowerShell-Module)

```
Import-JCCommand -URL "https://github.com/application-admin/JC-Commands/edit/main/queryAllSystems.ps1"
