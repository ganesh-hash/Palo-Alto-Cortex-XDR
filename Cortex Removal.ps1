function first {
    # Change directory to the specified path
    Set-Location "C:\Program Files\Palo Alto Networks\Traps"

    # Define the password
    $password = "<Your Custom Password>"

    # Define the full path to cytool.exe
    $cytoolPath = "C:\Program Files\Palo Alto Networks\Traps\cytool.exe"

    # Check if cytool.exe exists
    if (Test-Path $cytoolPath) {
        # Start the process without waiting for it to exit
        $process = Start-Process -FilePath $cytoolPath -ArgumentList "protect disable" -NoNewWindow -PassThru

        # Allow a moment for the process to initialize
        Start-Sleep -Seconds 2

        # Use Add-Type to enable the use of SendKeys
        Add-Type -AssemblyName System.Windows.Forms

        # Send the password followed by the Enter key
        [System.Windows.Forms.SendKeys]::SendWait("$password{ENTER}")

        # Get the package that starts with "Cortex XDR"
        $package = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "Cortex XDR*" }

        if ($package) {
            # Uninstall the package
            $package | ForEach-Object {
                $_.Uninstall()
                Write-Host "Uninstalled: $($_.Name)"
            }
        } else {
            Write-Host "No package found starting with 'Cortex XDR'."
        }
    } else {
        Write-Host "Error: cytool.exe not found at $cytoolPath"
    }
}

function second {

    # Change directory to the specified path
    Set-Location "C:\Program Files\Palo Alto Networks\Traps"

    # Define the password
    $password = "Password1"

    # Define the full path to cytool.exe
    $cytoolPath = "C:\Program Files\Palo Alto Networks\Traps\cytool.exe"

    # Get the package that starts with "Cortex XDR"
    $package = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "Cortex XDR*" }

    # Check if the package exists
    if (-not $package) {
        Write-Host "No package found starting with 'Cortex XDR'. Exiting script."
        exit
    }

    # Check if cytool.exe exists
    if (Test-Path $cytoolPath) {
        # Start the process without waiting for it to exit
        $process = Start-Process -FilePath $cytoolPath -ArgumentList "protect disable" -NoNewWindow -PassThru

        # Allow a moment for the process to initialize
        Start-Sleep -Seconds 2

        # Use Add-Type to enable the use of SendKeys
        Add-Type -AssemblyName System.Windows.Forms

        # Send the password followed by the Enter key
        [System.Windows.Forms.SendKeys]::SendWait("$password{ENTER}")

        # Uninstall the package
        $package | ForEach-Object {
            $_.Uninstall()
            Write-Host "Uninstalled: $($_.Name)"
        }
    } else {
        Write-Host "Error: cytool.exe not found at $cytoolPath"
    }
}

# Example of calling the functions in order
first
second
