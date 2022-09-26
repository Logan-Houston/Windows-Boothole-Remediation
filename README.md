This fix action is for ACAS plugins 139239. This fixes the secure boot vulnerabilty.
Solution includes the following files/folders and their use, Please ensure all are uploaded to a network share that admins have rights to access:

RemoteGRUBScript.ps1 -- Main Kicker script this will be executed in Powershell ISE launched as adminsitrator.

dbxupdate_x64.bin -- file that uis moved to local machine and makes new boot files

SplitDbxContent.ps1 -- Script that gets moved to local pc and creates files based off dbxupdate_x64.bin

Computernames.txt -- this is the text file that you will put all PC's names from ACAS scans. hint: make sure there are no blank spaces or script will fail.


How to run:

Copy all files to network share that admin accounts have access too.


Copy PC names from ACAS scan to "Computernames.txt" make sure there are no blank spaces. Make sure to save file.


Remote desktop into server/PC or log into PC with network administator account


Launch Powershell ISE as administrator


Open "RemoteGRUBScript.ps1" from Network share.


Modify variables in "RemoteGRUBScript.ps1" to reflect your wings network locations. Line 10 ($computers) and Line 15 ($sourcefile)


Click Green Run button at top to intiate script.


