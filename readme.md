# Ethical Hacking Lab - Reverse Shell with PowerShell and Netcat

Title: Ethical Hacking Lab - Reverse Shell with PowerShell and Netcat

Objective: Create a reverse shell connection between two Windows 11 systems using PowerShell and Netcat.

Lab Requirements:

1. Two clean Windows 11 systems (Target & Host)
2. PowerShell script (provided in the description)
3. Netcat installed on the Host system

Instructions:

1. Prepare the systems:
    
    1.1. Ensure that both Windows 11 systems are up and running.
    
    1.2. Install Netcat on the Host system by downloading it from the official website (**[https://nmap.org/ncat/](https://nmap.org/ncat/)**).
    
2. Set up the Host system:
    
    2.1. Open the command prompt on the Host system.
    
    2.2. Type the following command to start a Netcat listener on port 4444:
    
    ```
    
     ```
     netcat -nvlp 4444
     ```
    
    ```
    
3. Discover the Host's IP address:
    
    3.1. On the Target system, open PowerShell.
    
    3.2. Execute the following PowerShell script to find the IP address of the Host system:
    
    ```
    
     ```powershell
     $LocalIP = (Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName .).IPAddress[0]
     $LocalSubnet = $LocalIP.Substring(0, $LocalIP.LastIndexOf('.'))
     $Port = 4444
    
     for ($i = 1; $i -le 254; $i++) {
         $TargetIP = "$LocalSubnet.$i"
         $Test = Test-NetConnection -ComputerName $TargetIP -Port $Port -WarningAction SilentlyContinue
         if ($Test.TcpTestSucceeded) {
             Write-Host "Host IP Address: $TargetIP"
             break
         }
     }
     ```
    
    ```
    
    3.3. Note down the Host IP address displayed by the script.
    
4. Execute the reverse shell script on the Target system:
    
    4.1. Open PowerShell on the Target system.
    
    4.2. Copy and paste the provided PowerShell script into the PowerShell console.
    
    4.3. When prompted, enter the Host IP address and port (4444) discovered in step 3.
    
5. Control the Target system:
    
    5.1. On the Host system, you should see a connection established in the command prompt.
    
    5.2. You can now type commands into the Host's command prompt, and they will be executed on the Target system.
    
    5.3. To end the reverse shell session, type "exit" into the Host's command prompt.
    
6. Cleanup:
    
    6.1. Close the command prompt on the Host system.
    
    6.2. Close PowerShell on the Target system.
    

Congratulations! You have successfully created a reverse shell connection between two Windows 11 systems using PowerShell and Netcat.
