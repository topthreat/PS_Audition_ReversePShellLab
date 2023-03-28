# 🚀 Ethical Hacking Lab - :computer: Reverse Shell with PowerShell and Netcat

## Create a reverse shell connection between two Windows 11 systems using PowerShell and NetCat.

### Lab Requirements
Two Windows 11 systems that share the same subnet (Target 🎯 & Host 🏠)

 - **Target**
	 - Open Powershell 
		 - Win-R - Type 'powershell' - <kbd>Control</kbd>-Shift-Enter]
		 - Enter the following at the Powershell command prompt:
			 - `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
			 - Type 'Y' and press [Enter] to acknowledge the security concerns
			 - Browse to the directory containing the *setupTarget.ps1* script
			 - The system will reboot once the script has completed
 - **Host**
	 - Open Powershell 
		 - Win-R - Type 'powershell' - [CNTR-Shift-Enter]
		 - Enter the following at the Powershell command prompt:
			 - `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
			 - Type 'Y' and press [Enter] to acknowledge the security concerns
			 - Browse to the directory containing the *setupHost.ps1* script
			 - The system will reboot once the script has completed	
### Instructions
Ready, Set, Go! 🏁 Ensure that both Windows 11 systems are up and running.

### Listener Setup 🛠️:

- Open the command prompt or Powershell on the Host system.
- Start the Netcat listener on port 4444 with the following command:

    `netcat -nvlp 4444`

### Host IP Address Hunt 🔍

 - Open PowerShell on the Target system and unleash the locateHost.ps1 PowerShell script to find the elusive IP address of the Host system.
- Note down the Host IP address unveiled by the script.

### Hooking Up 🎯
- Open PowerShell on the Target system.
- Copy and paste the sacred PowerShell script into the PowerShell console.
- When prompted, enter the discovered Host IP address and port (4444) 

### Taking Control 💪
- On the Host system, watch as the connection is established.
- Now, you can type commands into the Host's command prompt, and watch as they are executed on the Target system.
- Try some commands such as 'whoami' or 'ipconfig' 
- To gracefully end the reverse shell session, type "exit" into the Host's command prompt.

### Cleaning Up 🧹
- Close the command prompt on the Host system.
- Close PowerShell on the Target system.

### 🎉 Congratulations! You have successfully created a reverse shell connection between two Windows 11 systems using PowerShell and Netcat. Remember to use your newfound powers responsibly and ethically!
