# Linux-Sysmonitor
A wrapper shell scrip that can be tweaked to acquire essential system information


1)	1st  download the “mySysMonitor.zip” from the link “vle.dmu.blackboard” 
2)	Choose the location to save the downloaded file
3)	Open the “mySysMonitor.zip” file from the saved location where the file is saved
4)	There will be a file named “mySysMonitor.sh” which is the monitoring script. Extract the file to any desired location according to choice.
5)	Now to run the script it is necessary to check the file permissions and if it has only “Read-Only” permissions, it needs to be changed.
6)	To check file permissions open “Terminal or Console”.The prompt will be “$”. and to go to the location where the file is saved. To do so use the “cd” command. For Example, if the file is in Desktop the type “cd Desktop” and Press “Enter”
7)	Once you are in the folder the command prompt will change from “~$” to “~/Folder$”(Folder is the name of the location where the file is located)
8)	Type “ls -a” to see the file permissions of the “mySysMonitor.sh” file it will show a set of characters like “-rw-r--r--”
Which means the file has no execute permission. To change file permissions to execute type “chmod 750 mySysMonitor.sh” to change the file permissions to execute and once ut is done then type “ls -all” again to check file permissions. The set character will be shown as “-rwxrwxrwx” which means that the file now execution permissions. And the file will appear in green colour in the terminal.
9)	To execute the file type “./mySysMonitor.sh” at the terminal prompt and press enter. Then the terminal will show the execution of commands and progress of the script run and once the execution is done the script will automatically open a webpage in “firefox browser”. 
10)	The opened webpage will prompt you for login into the “mySysMonitor login”. The default credentials for login are: “Username: admin” and “Password: admin”. Once login is successful it will take you to another webpage where the details will be listed.
11)	Each and every detail is dissected into head names and arranged in the side navigation bar. On clicking every tab the relevant details will be shown.
12)	Once the viewing is finished click on the “LogOut” tab to log out of the page for security measures and purposes.
