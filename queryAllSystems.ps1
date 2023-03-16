# query systems
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
