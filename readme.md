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

![image](https://user-images.githubusercontent.com/20422508/228392220-d1e7a49c-de02-43d6-88b7-1971d8d5782a.png)

![image](https://user-images.githubusercontent.com/20422508/228333736-cb73b5c2-cfb4-4c58-9276-912f308bb58a.png)

![image](https://user-images.githubusercontent.com/20422508/228340630-864d5b57-801c-4873-988e-b36b5e0fa1be.png)


### Instructions
Ready, Set, Go! 🏁 Ensure that both Windows 11 systems are up and running.

### Listener Setup 🛠️ 🏠
The listener will await packets from any system that can reach it. Without this, you would not be able to recieve the messages sent from the target 🎯 system.

- Open the command prompt on the Host 🏠 system <kbd>Win-R</kbd>cmd<kbd>Enter</kbd>
- Start the Netcat listener on port 4444 with the following command:

    `nc -nvlp 4444`

Note: If needed, click `Allow Access` to allow netcat to communicate on private networks.

![image](https://user-images.githubusercontent.com/20422508/228391374-3bd02339-fe2d-4b43-9983-4c6868d6e3c8.png)


### IP Address Hunt 🎯 🔍

- You will need to enter the IP address of the host 🏠 so the reverse shell knows where it needs to connect. The simplest method may be to type `ipconfig` into the 'cmd.exe' prompt on your Host machine. This will provide you with the IP address that you will need to use when running your reverse shell script. 

::scroll:: If you know of any other methods to get the host 🏠 IP address go for it!! This is a great place to practice your skills!

![image](https://user-images.githubusercontent.com/20422508/228348116-6da81ecf-f19d-4a3c-8141-d73109cc7305.png)

### Hooking Up 🎯
To access the listener you will need to use a reverse shell. This will allow the system that you connect to remotely send commands to your system. 
- Open PowerShell on the Target 🎯 system.
- Execute the `ReverseShell.ps1` file
- When prompted, enter the discovered Host 🏠 IP address and port (4444) 

![image](https://user-images.githubusercontent.com/20422508/228391677-1aad2802-e130-47c8-8c86-9709356159e5.png)

![image](https://user-images.githubusercontent.com/20422508/228391620-ea211d81-ba5e-4562-9d73-b6a7bc6e6a01.png)

### Taking Control 💪
Once the connection has been established you will be able to type many different operating system commands. Keep in mind that you will be limited to the same access as the user that has initiated the reverseshell.
- On the Host 🏠 system, watch as the connection is established.
- Now, you can type commands into the Host's 🏠 command prompt, and watch as they are executed on the Target 🎯 system.
- Try some commands such as `dir`, `whoami` or `ipconfig` 
- To gracefully end the reverse shell session, type `exit` into the Host's command prompt and press <kbd>Enter</kbd>.

![image](https://user-images.githubusercontent.com/20422508/228391844-a4ab9756-7ba6-4a7a-bbda-339abb3ddf70.png)

![image](https://user-images.githubusercontent.com/20422508/228391880-27d9364e-6798-4c09-8c51-552c7eb4438b.png)


### Going the Distance :runner:
At this point, review the powershell scripts and try to understand why things work the way they do. Is there anything you can do to improve the scripts slightly? Could you possibly create your own Powershell listener script instead of relying on Netcat? Could you possibly setup a scheduled task that runs the listener and one that automatically runs the reverseshell? 

### Cleaning Up 🧹
- Close the command prompt on the Host 🏠 system.
- Close PowerShell on the Target 🎯 system.

### 🎉 Congratulations! You have successfully created a reverse shell connection between two Windows 11 systems using PowerShell and Netcat. Remember to use your newfound powers responsibly and ethically!


