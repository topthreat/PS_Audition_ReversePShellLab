##🚀 Ethical Hacking Lab - Reverse Shell Extravaganza with PowerShell and Netcat

Embark on an exciting adventure and create a reverse shell connection between two Windows 11 systems using the mystical powers of PowerShell and the enigmatic charm of Netcat.

Lab Requirements:
Two Windows 11 systems that share the same subnet (Target 🎯 & Host 🏠)
Instructions:
Ready, Set, Go! 🏁 Ensure that both Windows 11 systems are up and running.
Host System Setup 🛠️:
2.1. Open the command prompt on the Host system.
2.2. Summon the Netcat listener on port 4444 with the incantation:
yaml
Copy code
netcat -nvlp 4444
Host IP Address Hunt 🔍:
3.1. Open PowerShell on the Target system and unleash the locateHost.ps1 PowerShell script to find the elusive IP address of the Host system.
3.2. Note down the Host IP address unveiled by the script.
Target System's Time to Shine 🎯:
4.1. Open PowerShell on the Target system.
4.2. Copy and paste the sacred PowerShell script into the PowerShell console.
4.3. When prompted, enter the Host IP address and port (4444) discovered in step 3.
Taking Control 💪:
5.1. On the Host system, witness the connection established in the command prompt.
5.2. Now, you can type commands into the Host's command prompt, and watch as they are executed on the Target system.
5.3. To gracefully end the reverse shell session, simply type "exit" into the Host's command prompt.
Cleaning Up 🧹:
6.1. Close the command prompt on the Host system.
6.2. Close PowerShell on the Target system.
🎉 Congratulations! You have successfully created a reverse shell connection between two Windows 11 systems using PowerShell and Netcat. Remember to use your newfound powers responsibly and ethically!
