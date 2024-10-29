Before beginning, ensure all operations are performed in PowerShell running as Administrator. 
Note: Replace Password with Password being used while generating the Cortex agents.

### Steps:

1. View Existing Execution Policy :
Command: Get-ExecutionPolicy

2. Set the Execution Policy to Unrestricted for the Current Session :
Command: Set-ExecutionPolicy Unrestricted -Scope Process -Force

3. Navigate to the Script Directory where the script is located :
Command: cd "C:\Path\To\DownloadedScript"

4. Run the Cortex Removal Script:
Command: .\Cortex Removal.ps1
