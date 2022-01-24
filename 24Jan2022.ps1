$users = Import-csv -path e:users.csv

$users = get-content -path e:users.csv | convertfrom-csv
$users | convertto-json | out-file e:\users.json
$users | Export-Clixml -path e:\users.xml

$jsonusers = get-content e:\users.json | convertfrom-json

get-content e:\users.csv
get-content e:\users.json
get-content e:\users.xml

$password = Read-host "Give Password" 
$cred = Get-credential
 
 get-service | select-object -property status,starttupe,name | out-gridview

 get-service | select-object -property status,starttupe,name | out-gridview -OutputMode multiple | Stop-Service -whatif

 get-aduser -filter * -properties department | where-object {$_.Department -eq 'Sales'} | 
 Out-gridview -outputmode multiple | set-aduser -Department 'Marketing'

  
 get-aduser -filter * -properties department | where-object {$_.Department -eq 'Marketing'} | select name

 Param (
 [string]$Computername,
 [int]$EventID,
 [string]$logName
 )

 Get-eventlog -logname $logname -ComputerName $computername | where-object {$_.EventID -eq $EventID | 
 Select-object -First 5

 #.\24jan2022.ps1 -logname sytem -computername lon-dc1 -eventid 4624


  [Cmdletbinding()]
 Param (
 [string]$Computername = (Read-Host "Enter Computername"),
 [int]$EventID = 4624,
 [Validateset('Security','System','Application')]
 [string]$logName ='Security'
 )
 write-verbose "The Computer name is $computername"
 Write-debug "This is debugging just before the get-eventlog"

 Get-eventlog -logname $logname -ComputerName $computername | where-object {$_.EventID -eq $EventID} | 
 Select-object -First 5

 #Function
 function Add-calculator {
 [cmdletbinding()]
 Param (
 [int]$Number1, 
 [int]$Number2
 )
 $sum=$Number1 + $Number2
 return $sum
 }

 Add-calculator -Number1 34 -Number2 889
 $Sum

 
 import-module E:\calc.psm1
 get-command -module mathtools

 Add-calculator -Number1 34 -Number2 65

 Add-calculator | gm