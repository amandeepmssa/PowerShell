get-command foreach
$wc = [system.net.webclient]::new()
[system.math]::

$services=get-service
foreach ($service in $services)
{
if ($service.status -eq 'Running')
{
$service.name
$service.status
}
}
$counter=0
do {
$menu=@'
1.  Be Happy
2.  Be Rich
'@

Write-Host $Menu
$choice = Read-host -promt "Please enter a number"
switch ($choice)
{
1 {Write-Host ':)'}
2 {Write-Host '$$$'}
Default {Write-Host 'No Choice made'}

}
$counter++
}
# while ($choice -gt 2 -or $choice -lt 1)
until ($choice -in @(1,2) -or $counter -ge 3)




get-service | where-object {$_.status -eq 'Running'} | format-list -property name,starttype,status
get-service | get-member -MemberType properties

get-service | 
select-object -property name,starttype,status | 
where-object {$_.status -eq 'Running'} | Sort-Object -property startype,name

get-service | 
select-object -property name,starttype,status | 
where-object {$_.status -ne 'Running' -and $_.starttype -eq 'Automatic' } |
 Sort-Object -property startype,name

[int[]]$numbers = @(1,5,3,8,7)
[int]$Multipler = 5
$Answers = $Numbers * $Multipler

$Number | Foreach-object {$_ * $Multipler}
@(1,5,3,8,7) | foreach-object {$_ * 5}



[int[]]$numbers= @(12,0,4,3,-1,25,121)
foreach ($number in $numbers) { 
if ($number -ge 1) 
{[math]::sqrt($number) }
}

For($i=1; $i -le 10; $i++)
{
Write-Host "Creating User $i"
}

1..10 | Foreach-object{
 Write-Host "Line Number $_"
}

for ($i = 1; $i -lt 99; $i++){ 
    
}


[int[]]$numbers= @(12,0,4,3,-1,25,121)
foreach ($number in $numbers) { 
if ($number -eq 0) {continue}
#{[math]::sqrt($number) 
#elseif ($number -le 10){continue}
144/$number
}
$number / 5
}

$isprime = $true
$possprime =17
foreach ($Div in @(2..($possprime-1))) {
$test=$possprime%$Div 
if ($test -eq 0) { $IsPrime = $false
break}


}
Write-Host "$Possprime, is it a prime? $IsPrime"



get-help Get-NetIPConfiguration -ShowWindow
find-module subnettools
install-module subnettools
get-help find-validsubnet
get-childitem
C:\script.ps1
set-executionpolicy restricted
get-executionpolicy
E:\Mod07\Democode\copy.ps1
set-executionpolicy unrestricted
get-childitem Cert:\CurrentUser\My\ -codesigningcert
$cert=get-childitem Cert:\CurrentUser\my\ -CodeSigningCert
set-authenticodesignature -filepath E:\Mod07\Democode\Copy.ps1 -Certificate $cert
set-executionpolicy allsigned

$codecert = Get-ChildItem -path cert:\currentuser\my -codesigningcert

Set-AuthenticodeSignature -FilePath E:\simplescript.ps1 -certificate $codecert
