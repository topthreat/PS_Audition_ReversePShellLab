# 🚀 Ethical Hacking Lab - :computer: Reverse Shell with PowerShell and Netcat

## Create a reverse shell connection between two Windows 11 systems using PowerShell and NetCat.

### Lab Requirements
Two Windows 11 systems that share the same subnet (Target 🎯 & Host 🏠)

 - **Target 🎯**
	 - Copy the setupTarget.ps1 file to your desktop
	 - Open Powershell 
		 - <kbd>Win-R</kbd> - Type `powershell` - <kbd>Control</kbd>-<kbd>Shift</kbd>-<kbd>Enter</kbd> then click the *Yes* button.
		 - Enter the following at the Powershell command prompt:
			 - `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
			 - Type 'Y' and press <kbd>Enter</kbd> to acknowledge the security concerns
			 - Execute the `setupTarget.ps1` script (Example: `c:\Users\Username\Desktop\setupTarget.ps1`)
			 - The system may reboot once the script has completed
 - **Host 🏠**
	 - Copy the setupHost.ps1 file to your desktop
	 - Open Powershell 
		 - <kbd>Win-R</kbd> - Type 'powershell' - <kbd>Control</kbd>-<kbd>Shift</kbd>-<kbd>Enter</kbd> then click the *Yes* button.
		 - Enter the following at the Powershell command prompt:
			 - `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
			 - Type 'Y' and press <kbd>Enter</kbd> to acknowledge the security concerns
			 - Execute the `setupHost.ps1` script (Example: `c:\Users\Username\Desktop\setupHost.ps1`)
			 - The system may reboot once the script has completed	

![image](https://user-images.githubusercontent.com/20422508/228394013-2e260044-1408-42a8-8aac-d59288249a3b.png)

![image](https://user-images.githubusercontent.com/20422508/228333736-cb73b5c2-cfb4-4c58-9276-912f308bb58a.png)

![image](https://user-images.githubusercontent.com/20422508/228340630-864d5b57-801c-4873-988e-b36b5e0fa1be.png)


### Instructions
Ready, Set, Go! 🏁 Ensure that both Windows 11 systems are up and running.

### IP Address Hunt 🎯 🔍

You will need to enter the IP address of the host 🏠 so the reverse shell knows where it needs to connect. 
- The simplest method may be to type `ipconfig` into the 'cmd.exe' prompt on your Host machine. This will provide you with the IP address that you will need to use when running your reverse shell script. 
	- Open the command prompt on the Host 🏠 system <kbd>Win-R</kbd>`cmd`<kbd>Enter</kbd>
	 ![image](https://user-images.githubusercontent.com/20422508/228397368-2f02a0b8-17a5-46d4-b4a1-ce3914093fb4.png)
- If you know of any other methods to get the host 🏠 IP address go for it!! This is a great place to practice your skills!

### Listener Setup 🛠️ 🏠
The listener will await packets from any system that can reach it. Without this, you would not be able to recieve the messages sent from the target 🎯 system.

- Open the command prompt on the Host 🏠 system <kbd>Win-R</kbd>'cmd'<kbd>Enter</kbd>
- Start the Netcat listener on port 4444 with the following command which will start a Netcat listener on port 4444 with verbose output and no DNS resolution:

    `nc -nvlp 4444`

Note: If needed, click `Allow Access` to allow netcat to communicate on private networks.

![image](https://user-images.githubusercontent.com/20422508/228391374-3bd02339-fe2d-4b43-9983-4c6868d6e3c8.png)


### Hooking Up 🎯
To access the listener you will need to use a reverse shell. This will allow the host🏠 to remotely send commands to your target🎯. 
- Open PowerShell on the Target 🎯 system.
- Execute the `ReverseShell.ps1` file
- When prompted, enter the discovered Host 🏠 IP address and port (4444) 

### Taking Control 💪
Once the connection has been established you will be able to type many different operating system commands. Keep in mind that you will be limited to the same access as the user that has initiated the reverseshell.
- On the Host 🏠 system, watch as the connection is established.
- Now, you can type commands into the Host's 🏠 command prompt, and watch as they are executed on the Target 🎯 system.
- Try some commands such as `dir`, `whoami` or `ipconfig` 
- To gracefully end the reverse shell session, type `exit` into the Host's command prompt and press <kbd>Enter</kbd>.

![image](https://user-images.githubusercontent.com/20422508/228400075-cf262c97-4a13-430b-859e-8322a4fd8a70.png)


### Going the Distance :runner:
At this point, review the powershell scripts and try to understand why things work the way they do. 
- Is there anything you can do to improve the scripts slightly? 
- Could you possibly create your own Powershell listener script instead of relying on Netcat? 
- Could you possibly setup a scheduled task that runs the listener and one that automatically runs the reverse shell? 

### Cleaning Up 🧹
- Close the command prompt on the Host 🏠 system.
- Close PowerShell on the Target 🎯 system.

### 🎉 Congratulations! You have successfully created a reverse shell connection between two Windows 11 systems using PowerShell and Netcat. Remember to use your newfound powers responsibly and ethically!


