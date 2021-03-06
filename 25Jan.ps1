<# Q1.1 Create a function that takes a string as a parameter and reverses the case, 
upper case changed to lower case and lower case changed to upper case#>
function changecase {
param([string]$InputString)
[string]$Changedword=''
foreach ($Character in $inputstring.tochararray()) {
if($character -cmatch "[a-z]")
{$NewChar=$character.tostring().toupper()}
elseif($character -cmatch "[A-Z]")
{$NewChar =$character.tostring().tolower()}
else {$NewChar = $Character}
$Changedword = $Changedword + $NewChar
}
return $Changedword
}

ChangeCase -Inputstring "Amandeep Rekhi"


#########################################
<#  Create a function that takes two strings in an array and compares the first character of the first word with the last 
character of the second word if they are the same return $true in not return $false#>
function compareTwoWords{
[cmdletbinding()]
Param(
[string[]]$TwoWords)
if ($TwoWords[0][0] -eq $TwoWords[-1][-1]){return $true}
else {return $false}

}
CompareTwoWords -TwoWords @("billy","hob","roy")




#/ [string]$TestVar = 'testValid'
#$testvar | gm
#$testvar.tochararray()
# $TestVar[0].ToString().ToUpper()

###############################################
#CALCULATE AGE in DAYS
<# Create a function that calculates your age in days #>
function ageindays {
[cmdletbinding()]
Param (
[datetime]$dob )

$TodaysDate = [datetime]::Now
$Numberofdays = $TodaysDate - $dob
#$Numberofdays | gm


return $NumberofDays.days

}

ageindays -dob "30 Jan 1983"

<# [datetime]$TestAge=(Read-Host "Enter age")
Write-Host "Age you Entered"
[datetime]$Age= "30 Jan 1983"
$Age | gm
$Age.TimeofDay #>

###############################################

<# Q3.1 Write a function that will take an array of integers
 and will return the value of the smallest and largest added together #>

function comparenumbers{
[cmdletbinding()]
Param(
[int[]]$numbers)
[int]$Largest=$numbers[0]
[int]$Smallest=$numbers[0]

foreach ($number in $numbers){
if($number -le $smallest){
$smallest = $number
}
}
foreach ($number in $numbers){
if($number -gt $Largest)
{$largest = $number}
}
return $smallest+$largest

}
comparenumbers 7,23,1,800,105,4,1500,60,3,75

#####################################################

function comparenumbers1{
[cmdletbinding()]
Param(
[int[]]$numbers)
$Sorted = $numbers | Sort-Object

return $Sorted[0]+$Sorted[-1]

}
comparenumbers1 7,23,1,800,105,4,1500,60,3,75

######################################################
<# Q3.2 Create a function that takes a word as a parameter 
and returns the count of vowels and the count of consonants #>

function countvc{
[cmdletbinding()]
Param([string]$word)
[int]$v=0
[int]$c=0
foreach($alphabet in $word.tochararray()){
if(($alphabet -eq 'a') -or ($alphabet -eq 'i') -or ($alphabet -eq 'e')  -or ($alphabet -eq 'o') -or ($alphabet -eq 'u') )
{$v++}
else
{$c++}
}
return " Vowels $v, Consonants $c "
}

countvc "bible book"

#$alphabet -match '[aeiou]'
#$alphabet -match '[bcdfghjklmnpqrstyxz]'

function countvc{
[cmdletbinding()]
Param([string]$word)
[int]$v=0
[int]$c=0
foreach($alphabet in $word.tochararray()){
if($alphabet -match '[aeiou]')
{$v++}
elseif($alphabet -match '[bcdfghjklmnpqrstvwxyz]')
{$c++}
}
return " Vowels $v, Consonants $c "
}

countvc "bible book History"

###########################################

<# Q4.1 Write a function that lists all of the processes and shows the following: Name, ID, VirtualMemory
 for all processes that start with a letter given via a parameter#>

function ListProcess{
[cmdletbinding()]
Param(
[char]$Letter)
get-process -Name "$Letter*" | select-object -Property Name,Id,VirtualMemorysize

}

ListProcess -Letter t

#get-command *Process*
#get-process | gm
#get-process -Name "t*" | select-object -id

################################################


function Download {
Param( [string]$URL )
$WebClientObj = [System.Net.WebClient]::new()
$WebClientObj.DownloadFile($URL,'e:\words.txt')
$WebClientObj | gm
$WebClientObj | select-object -Property site
}
Download -URL 'http://www.mieliestronk.com/corncob_lowercase.txt'

<# Task 1: Create a test group
On LON-CL1, use PowerShell to create a new Active Directory Domain Services (AD DS) group named IPPhoneTest in the IT organizational unit.

Click for hint
Click to see the answer
Add the following users as members in the IPPhoneTest group:

Abbi Skinner
Ida Alksne
Parsa Schoonen
Tonia Guthrie
Click for hint
Click to see the answer
Task 2: Create a script to configure the ipPhone attribute
Create a script named E:\Mod07\Labfiles\ipPhone.ps1, and then open it in the Windows PowerShell ISE.

Use Get-ADGroupMember to create a query to obtain the membership of the IPPhoneTest group.

Create a ForEach loop that processes the users that are members of IPPhoneTest.

In the loop:

Use Get-ADUser to retrieve the first and last names for a user.
Calculate the required value for the ipPhone attribute.
Use Set-ADUser with the -Replace parameter to set the ipPhone attribute for the user.
Click for hint
Click to see the answer
Run the script and then verify that the ipPhone attribute is modified for the selected users.

Click to see the answer #>
#get-command *group* -Module ActiveDirectory

New-Adgroup -Name IPphoneTest -path 'OU=IT,DC=Adatum,DC=com' -GroupScope Global
$TestUsers = get-aduser -filter * | where-object {$_.Name -in 'Abbi Skinner',
'Ida Alksne','Parsa Schoonen','Tonia Guthrie'}

Add-ADGroupMember -Identity IpPhoneTest -Members $TestUsers

Get-ADGroupMember -Identity IpPhoneTest


$TestUsers = Get-AdGroupMember -Identity ipphonetest

Foreach ($user in $TestUsers){
  $Userinfo = Get-AdUser -Identity $user
  #$Userinfo | select-object -property *
  $ipphonephoneAttribute = $Userinfo.givenname + '.' + $userinfo.surname + '@adatum.com'
  set-Aduser -identity $user -replace @{ipphone=$ipphonephoneAttribute}
}
