##V1.0 Initial release written by Tsgt Frederick Premuto ANG 105CF/SCOO
##V1.1 Modified by A1C Logan Houston 366 CS/SCOO

$test = test-path -path "C:\Temp" 
if ($test -eq $true) {}
Else {New-Item -Path "c:\" -Name "Temp" -ItemType "directory"}
Start-Transcript -Path C:\temp\Script.log
Write-Host "Creating Log File at C:\temp\Script.log"

$computers = Get-Content 'C:\Users\1572904420A\Downloads\Boothole 8Feb22.csv'

$sourcefile = "C:\Users\1572904420A\Desktop\Scripts\Windows Boothole"

$total = $computers.count 
$x = 0
foreach ($Computer in $Computers) {
$percentage = ($x / $total)*100
write-progress -Activity "Progress" -Status $Computer -PercentComplete $percentage
#Get-Service -ComputerName $Computer -ServiceName WinRM | Start-Service

$destinationFolder = "\\$computer\c$"
Robocopy "$sourcefile" "\\$Computer\C$" "SplitDbxContent.ps1" /r:1

Robocopy "$sourcefile" "\\$Computer\C$" "dbxupdate_x64.bin" /r:1 


Write-Host "Robocopy Complete $computer" -ForegroundColor Cyan
Unblock-File -Path "\\$Computer\C$\SplitDbxContent.ps1"
Invoke-Command -ComputerName $computer  -Scriptblock {Set-Location C:\; C:\SplitDbxContent.ps1 C:\dbxupdate_x64.bin -force}
Invoke-Command -ComputerName $computer  -Scriptblock {Set-Location C:\; Set-SecureBootUefi -Name dbx -ContentFilePath .\content.bin -SignedFilePath .\signature.p7 -Time 2010-03-06T19:17:21Z -AppendWrite}
#Restart-Computer -ComputerName $computer -Force
#Write-Host "[*] Post install restart $computer" -ForegroundColor Green
$x++
}
Stop-Transcript