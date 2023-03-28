# 🚀 Ethical Hacking Lab - :computer: Reverse Shell with PowerShell and Netcat

## Create a reverse shell connection between two Windows 11 systems using PowerShell and NetCat.

### Lab Requirements
Two Windows 11 systems that share the same subnet (Target 🎯 & Host 🏠)

 - **Target**
	 - Copy the setupTarget.ps1 file to your desktop
	 - Open Powershell 
		 - <kbd>Win-R</kbd> - Type 'powershell' - <kbd>Control</kbd>-<kbd>Shift</kbd>-<kbd>Enter</kbd> then click the *Yes* button.
		 - Enter the following at the Powershell command prompt:
			 - `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
			 - Type 'Y' and press <kbd>Enter</kbd> to acknowledge the security concerns
			 - Execute the `setupTarget.ps1` script (Example: `c:\Users\Username\Desktop\setupTarget.ps1`)
			 - The system may reboot once the script has completed
 - **Host**
	 - Copy the setupHost.ps1 file to your desktop
	 - Open Powershell 
		 - Win-R - Type 'powershell' - <kbd>Control</kbd>-<kbd>Shift</kbd>-<kbd>Enter</kbd> then click the *Yes* button.
		 - Enter the following at the Powershell command prompt:
			 - `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
			 - Type 'Y' and press <kbd>Enter</kbd> to acknowledge the security concerns
			 - Execute the `setupHost.ps1` script (Example: `c:\Users\Username\Desktop\setupHost.ps1`)
			 - The system may reboot once the script has completed	

![image](https://user-images.githubusercontent.com/20422508/228333736-cb73b5c2-cfb4-4c58-9276-912f308bb58a.png)

![image](https://user-images.githubusercontent.com/20422508/228340630-864d5b57-801c-4873-988e-b36b5e0fa1be.png)


### Instructions
Ready, Set, Go! 🏁 Ensure that both Windows 11 systems are up and running.

### Listener Setup 🛠️:

- Open the command prompt or Powershell on the Host system.
- Start the Netcat listener on port 4444 with the following command:

    `netcat -nvlp 4444`

### Host IP Address Hunt 🔍

- The simplest method may be to type ipconfig into the cmd prompt on your Host machine. This will provide you with the IP address that you will need to use when running your reverse shell script.

![image](https://user-images.githubusercontent.com/20422508/228348116-6da81ecf-f19d-4a3c-8141-d73109cc7305.png)


### Hooking Up 🎯
- Open PowerShell on the Target system.
- Execute the `ReverseShell.ps1` file
- When prompted, enter the discovered Host IP address and port (4444) 

### Taking Control 💪
- On the Host system, watch as the connection is established.
- Now, you can type commands into the Host's command prompt, and watch as they are executed on the Target system.
- Try some commands such as `dir`, `whoami` or `ipconfig` 
- To gracefully end the reverse shell session, type "exit" into the Host's command prompt.

### Going the Distance :runner:

### Cleaning Up 🧹
- Close the command prompt on the Host system.
- Close PowerShell on the Target system.

### 🎉 Congratulations! You have successfully created a reverse shell connection between two Windows 11 systems using PowerShell and Netcat. Remember to use your newfound powers responsibly and ethically!

