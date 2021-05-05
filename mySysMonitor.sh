#!/bin/bash -x
# System Monitoring Script (mySysMonitor)
# Author : Anurag Jena 
# Version: 1.0.12  build 29 (24 November 2019)




mkdir mySysMonitor
cd mySysMonitor




this_instant= $(date +"%x %r %Z")
time_stamp= "Updated on $this_instant by $USER for $HOSTNAME"
update_time= date
time_stamp2= "Updated on $update_time by $USER for $HOSTNAME"
Network_connection= ping -c5 vle.dmu.ac.uk
ram_free=`free | grep Mem | awk {'print$4'}`
ram_used=`free | grep Mem | awk {'print$3'}`
ram_available=`free | grep Mem | awk {'print$7'}`

net_check()
{
if [ -z $Network_connection ]
then
      echo "Network Status: Connected"
else 
	echo "Network Status: Disconnected"
fi
}

NET_CHECK=$(net_check)

$time_stamp


#~~~~System Information Details (commands, variables)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#System_Details= `hostnamectl`
#hardware_info_detailed= `lshw`
#Hardware_Info= `lshw -short`
#Cpu_Info= `lscpu`
#Pci_info= `lspci`
#sys_up_time= `uptime -s`
#sys_up_duration= `uptime -p`
#system_load_average= `top | head -n 5`
#sys_time= `uptime`
#mem_use= `free -h`
#disk_use= `df -h /home | awk {'print $2,$3,$4,$5'}`

sys_info() 
{
$time_stamp2
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< SYSTEM INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
date
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Details Summary >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
hostnamectl 
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Hardware Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
lshw -short
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< CPU Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
lscpu
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< PCI Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
lspci
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Uptime >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
uptime -s
echo "    "
uptime
echo "     "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Uptime Duration >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
uptime -p
echo "    "
echo " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Load >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
echo "<pre>"
top -b -n 1 | head -5
echo "</pre>"
echo "      "
$(net_check)
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" 
df -h /home | awk {'print $2,$3,$4,$5'}
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Memory Usage >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
free -h
}

S_I_N=$(sys_info)


#~~~Operating System Details (variable, functions and Commands)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#os_name= cat /etc/issue
#os_kernel= uname -s
#os_type= uname -o
#os_release= uname -v
#os_version= uname -r
#os_node= uname -n
#os_hw_arch= uname -i

Os() 
{
$time_stamp2

echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< OPERATING SYSTEM INFORMATION FOR $HOSTNAME BY $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
date
echo "    "
echo " Operating System Name  " 
cat /etc/issue
echo "    "
echo "Operating System Kernel  " 
uname -s
echo "    "
echo " Operating System Distribution " 
uname -o
echo "    "
echo " Operating System Release  " 
uname -v
echo "    "
echo " Operating System version " 
uname -r
echo "    "
echo " Operating System Node   " 
uname -n
echo "    "
echo " Operating System Architecture  " 
uname -i

}

Oper_OS=$(Os)

#~~~Network Connection and Interface Details (variable, functions and commands)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#all_network_details= nmcli dev show

#network_interfaces=`ip address | grep inet`
#network_interfaces_gateway=`ip route | grep src`
#net_device=`nmcli device status | awk {'print$1'}`
#net_type=`nmcli device status | awk {'print$2'}`
#net_state=`nmcli device status | awk {'print$3'}`
#net_connection=`nmcli device status | awk {'print$4'}`


#all_network_details= nmcli dev show
#all_network_interfaces= nmcli device status

#internal_ip4= nmcli dev show | grep IP4.ADDRESS
#ip4_route=  nmcli dev show | grep IP4.GATEWAY

#internal_ip6= nmcli dev show | grep IP6.ADDRESS
#ip6_route=  nmcli dev show | grep IP6.GATEWAY

#mac_address= nmcli dev show | grep GENERAL.HWADDR

#dns_servers= nmcli dev show | grep DNS

#Network_interfaces_available= nmcli device status
#system_ipv6_address= ip -6 -br address
#system_ipv4_address= ip -4 -br address
#network_ipv4_default_route= ip -4 -br address
#network_ipv6_default_route= ip -6 -br address

#packet_statistics= ss -s
#packet_statistics_connectection= ss -stop
#firewall_ipv4= ss -4 -all
#firewall_ipv6= ss-6 -all
#firewall_detailed= ss -e



net_stats()
{
$time_stamp2

echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< NETWORK STATISTICS & INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
date

echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Network Interfaces >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
nmcli device status
echo "         "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Internal IPv4 Address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
nmcli dev show | grep IP4.ADDRESS
echo "         "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< IPv4 Default Gateway >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
nmcli dev show | grep IP4.GATEWAY
echo "         "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Internal IPv6 Address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
nmcli dev show | grep IP6.ADDRESS
echo "         "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< IPv6 Default Gateway >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
nmcli dev show | grep IP6.GATEWAY
echo "         "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Mac Address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
nmcli dev show | grep GENERAL.HWADDR
echo "         "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DNS Servers >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
nmcli dev show | grep DNS
echo "         "
$(net_check)
echo "         "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Connection Statistics(Packets Information) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" 
ss -stop
echo "         "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< IPv4 Connections >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
ss -4 -all
echo "         "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< IPv6 Connections >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
ss -6 -all
echo "         "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Detailed Connections Monitoring >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
ss -e
}

net_int=$(net_stats)

# Users logged in current and available (commands, functions and variables)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#Available_users= getent passwd | awk -F: '{ print $1}'
#user_domain= id
#current_user= whoami
#current_user_all= last -F | head -n 1 | awk {'print $1,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20'}
#login_record= last -F
#login_record_system_change= last -d
#reboot_record= last reboot

users_log()
{
$time_stamp2

echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USERS INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
date
echo "    "
echo "Current User Logged In"
last -F | head -n 1 | awk {'print $1,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20'}
echo "     "
echo "Current User Domain:"
id
echo "     "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Last Users That Logged In >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
last -F
echo "     "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Changes Recorded With IP Address Associated >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
last -i
echo "       "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Reboots Log >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
last reboot
}

userlog=$(users_log)

# Devices Plugged in system~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#usb_device_list= lsusb
#usb_device_list_with_space= lsblk
#usb_list_detailed= usb-devices

dev_plugged_in()
{
$time_stamp2

echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USB DEVICES INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
date
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USB Devices Plugged In >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
lsusb
echo "     "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USB Devices Space >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
lsblk
echo "     "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USB Devices Detailed Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
usb-devices
}

usbdev=$(dev_plugged_in)

# Disk Space Available~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#disk_space_all= df -h
#disk_space_all_ext= df -ah
#disk_space_home= df hT /home
#home_directory_usage= df -h /home
#status_home_directory= stat /home
#status_root_directory= stat /

disk_space()
{
$time_stamp2

echo "    "
echo " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DISK INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
date
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage Details >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
df -h
echo "     "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage Details Extended >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
df -ah
echo "     "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< $USER Home Directory Usage >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
df -h /home
echo "      "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< $USER Home Status >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
stat /home
echo "      "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Root Directory Status >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
stat /

}
diskspace=$(disk_space)

# Key Directories Usage~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#space_available_for_user= df -ah ${HOME}/

#download_detailed_usage_list= du -ah $HOME/Downloads
#download_detailed_size= df -ah $HOME/Downloads

#destop_detailed_size= df -ah $HOME/Desktop
#desktop_detailed_size_list= du -ah $HOME/Desktop

#documents_detailed_size= df -ah $HOME/Documents
#documents_detailed_size_list= du -ah $HOME/Documents

#music_detailed_size= df -ah $HOME/Music
#music_detailed_size_list= du -ah $HOME/Music

#pictures_detailed_size= df -ah $HOME/Pictures
#pictures_detailed_size_list= du -ah $HOME/Pictures

#videos_detailed_size= df -ah $HOME/Videos
#videos_detailed_size_list= du -ah $HOME/Videos

#favorites_detailed_size= df -ah $HOME/Favorites
#favorites_detailed_size_list= du -ah $HOME/Favorites

#public_detailed_size= df -ah $HOME/Public
#public_detailed_size_list= du -ah $HOME/Public

key_directory_usages()
{

$time_stamp2
echo " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< KEY DIRECTORIES FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
date
echo "    "
echo "DIRECTORY INFORMATION FOR $HOSTNAME For $USER"
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Space Available for $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
df -ah ${HOME}/
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By DOWNLOADS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Downloads
du -sh
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By DESKTOP >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Desktop
du -sh
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By DOCUMENTS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Documents
du -sh
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By MUSIC >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Music
du -sh
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By PICTURES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Pictures
du -sh
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By VIDEOS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Videos
du -sh
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By FAVORITES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Favorites
du -sh
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By PUBLIC >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Public
du -sh

echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Files By Directories >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DOWNLOADS Direcrtory Files >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Downloads
du -cah
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DESKTOP Direcrtory Files  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Desktop
du -cah
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DOCUMENTS Direcrtory Files >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Documents
du -cah
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< MUSIC Direcrtory Files >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Music
du -cah
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< PICTURES Direcrtory Files >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Pictures
du -cah
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< VIDEOS Direcrtory Files >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Videos
du -cah
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< FAVORITES Direcrtory Files >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Favorites
du -cah
echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< PUBLIC Direcrtory Files >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/Public
df -cah


cd Desktop/mysysmonitor/mySysMonitor
}
keydir=$(key_directory_usages)

# Installed Applications~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#installed_app_list= dpkg --get-selections
#installed_app_detail= apt list

app_info()
{
$time_stamp2

echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< APPLICATIONS INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
date
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Installed Applications List >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
dpkg --get-selections
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Installed Applications Details >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
apt list
}
appinfo=$(app_info)

# Current Process~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#formatted_processes= ps -eo pid,ppid,user,cmd

#full_formatted1= ps -eF
#full_formatted2= ps -ef

#root_privelaged_running= ps aux | grep root

#process_as_tree= ps -e --forest

#user_process= ps -u

#all_process_short= ps -A
#all_process_long= ps au

#all_process_list= ps aux

#user_short_process= ps -f
#user_long_process= ps -F

current_process()
{
$time_stamp2

echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< PROCESSES INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
date
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< All Current Processes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
ps au
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< All Current Processes In Tree >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
ps -e --forest
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< All User Processes FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
ps -u
echo "   "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< All Root Process >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
ps aux | grep root
}
process=$(current_process)

#Ram Details~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#Ram_product_Details= cat /proc/meminfo
#memory_free_short= lshw -short -C memory
#memory_free_long= lshw -C memory
#memory_stats= free -h

memory_info()
{
$time_stamp2

echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< MEMORY INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
date
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Memory Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
free -h
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< R.A.M INFORMATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
lshw -short -c memory
}

minfo=$(memory_info)

#Top Process~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#User= whoami

#all_process= top -n 10
#user_process= top -n 10 -U $User

#top_13_user_process= top  -n 1 -U $User | head -n 20  | tail -n 13
#top_13_root_process= top  -n 1 -U root | head -n 20  | tail -n 13

#top_13_process= top  -n 1 | head -n 20  | tail -n 13

top_process()
{
$time_stamp2

echo "    "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< TOP PROCESSES INFORMATION FOR $HOSTNAME & $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< TOP 13 Processes for $HOSTNAME >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
top  -b -n 1 | head -n 20  | tail -n 13
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< TOP 13 Processes for $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
top -b -n 1 -U $USER | head -n 20  | tail -n 13
echo "   "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< TOP 13 Root Processes For $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
top -b -n 1 -U root | head -n 20  | tail -n 13
}
loadprocess=$(top_process)











logger()
{
$time_stamp2 >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< SYSTEM INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
date >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Details Summary >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ">>mySysMonitor.log
hostnamectl >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Hardware Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
lshw -short >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< CPU Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ">>mySysMonitor.log
lscpu >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< PCI Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ">>mySysMonitor.log
lspci >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Uptime >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ">>mySysMonitor.log
uptime -s >>mySysMonitor.log
echo "    ">>mySysMonitor.log
uptime >>mySysMonitor.log
echo "     ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Uptime Duration >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ">>mySysMonitor.log
uptime -p >>mySysMonitor.log
echo "    " >>mySysMonitor.log
echo " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Load >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ">>mySysMonitor.log
 
top -b -n 1 | head -5 >>mySysMonitor.log

echo "      ">>mySysMonitor.log
$NET_CHECK >>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" >>mySysMonitor.log
df -h /home | awk {'print $2,$3,$4,$5'}>>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Memory Usage >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
free -h >>mySysMonitor.log



#~~~Operating System Details (variable, functions and Commands)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#os_name= cat /etc/issue
#os_kernel= uname -s
#os_type= uname -o
#os_release= uname -v
#os_version= uname -r
#os_node= uname -n
#os_hw_arch= uname -i


$time_stamp2 >>mySysMonitor.log

echo "    " >>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< OPERATING SYSTEM INFORMATION FOR $HOSTNAME BY $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
date >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo " Operating System Name  " >>mySysMonitor.log
cat /etc/issue >>mySysMonitor.log
echo "    " >>mySysMonitor.log
echo "Operating System Kernel  ">>mySysMonitor.log 
uname -s >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo " Operating System Distribution ">>mySysMonitor.log 
uname -o >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo " Operating System Release  ">>mySysMonitor.log 
uname -v >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo " Operating System version ">>mySysMonitor.log 
uname -r >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo " Operating System Node   ">>mySysMonitor.log 
uname -n >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo " Operating System Architecture  ">>mySysMonitor.log 
uname -i >>mySysMonitor.log



#~~~Network Connection and Interface Details (variable, functions and commands)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#all_network_details= nmcli dev show

#network_interfaces=`ip address | grep inet`
#network_interfaces_gateway=`ip route | grep src`
#net_device=`nmcli device status | awk {'print$1'}`
#net_type=`nmcli device status | awk {'print$2'}`
#net_state=`nmcli device status | awk {'print$3'}`
#net_connection=`nmcli device status | awk {'print$4'}`


#all_network_details= nmcli dev show
#all_network_interfaces= nmcli device status

#internal_ip4= nmcli dev show | grep IP4.ADDRESS
#ip4_route=  nmcli dev show | grep IP4.GATEWAY

#internal_ip6= nmcli dev show | grep IP6.ADDRESS
#ip6_route=  nmcli dev show | grep IP6.GATEWAY

#mac_address= nmcli dev show | grep GENERAL.HWADDR

#dns_servers= nmcli dev show | grep DNS

#Network_interfaces_available= nmcli device status
#system_ipv6_address= ip -6 -br address
#system_ipv4_address= ip -4 -br address
#network_ipv4_default_route= ip -4 -br address
#network_ipv6_default_route= ip -6 -br address

#packet_statistics= ss -s
#packet_statistics_connectection= ss -stop
#firewall_ipv4= ss -4 -all
#firewall_ipv6= ss-6 -all
#firewall_detailed= ss -e




$time_stamp2 >>mySysMonitor.log

echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< NETWORK STATISTICS & INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
date >>mySysMonitor.log

echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Network Interfaces >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
nmcli device status >>mySysMonitor.log
echo "         ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Internal IPv4 Address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
nmcli dev show | grep IP4.ADDRESS >>mySysMonitor.log
echo "         ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< IPv4 Default Gateway >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
ip -4 -br address >>mySysMonitor.log
echo "         ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Internal IPv6 Address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
nmcli dev show | grep IP6.ADDRESS>>mySysMonitor.log
echo "         ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< IPv6 Default Gateway >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
nmcli dev show | grep IP6.GATEWAY >>mySysMonitor.log
echo "         ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Mac Address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
nmcli dev show | grep GENERAL.HWADDR >>mySysMonitor.log
echo "         ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DNS Servers >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
nmcli dev show | grep DNS >>mySysMonitor.log
echo "         " >>mySysMonitor.log
$NET_CHECK >>mySysMonitor.log
echo "         " >>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Connection Statistics(Packets Information) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" >>mySysMonitor.log
ss -stop >>mySysMonitor.log
echo "         ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< IPv4 Connections >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
ss -4 -all >>mySysMonitor.log
echo "         ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< IPv6 Connections >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
ss -6 -all >>mySysMonitor.log
echo "         ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Detailed Connections Monitoring >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
ss -e >>mySysMonitor.log

# Users logged in current and available (commands, functions and variables)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#Available_users= getent passwd | awk -F: '{ print $1}'
#user_domain= id
#current_user= whoami
#current_user_all= last -F | head -n 1 | awk {'print $1,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20'}
#login_record= last -F
#login_record_system_change= last -d
#reboot_record= last reboot


$time_stamp2 >>mySysMonitor.log

echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USERS INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
date >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "Current User Logged In" >>mySysMonitor.log
last -F | head -n 1 | awk {'print $1,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20'}>>mySysMonitor.log
echo "     ">>mySysMonitor.log
echo "Current User Domain:">>mySysMonitor.log
id >>mySysMonitor.log
echo "     ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Last Users That Logged In >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
last -F >>mySysMonitor.log
echo "     ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Changes Recorded With IP Address Associated >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
last -d >>mySysMonitor.log
echo "       ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< System Reboots Log >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
last reboot >>mySysMonitor.log




# Devices Plugged in system~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#usb_device_list= lsusb
#usb_device_list_with_space= lsblk
#usb_list_detailed= usb-devices


$time_stamp2 >>mySysMonitor.log

echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USB DEVICES INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
date >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USB Devices Plugged In >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
lsusb >>mySysMonitor.log
echo "     ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USB Devices Space >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
lsblk >>mySysMonitor.log
echo "     ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USB Devices Detailed Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
usb-devices >>mySysMonitor.log




# Disk Space Available~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#disk_space_all= df -h
#disk_space_all_ext= df -ah
#disk_space_home= df hT /home
#home_directory_usage= df -h /home
#status_home_directory= stat /home
#status_root_directory= stat /


$time_stamp2 >>mySysMonitor.log

echo "    ">>mySysMonitor.log
echo " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DISK INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
date >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage Details >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -h >>mySysMonitor.log
echo "     ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage Details Extended >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
echo "     ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< $USER Home Directory Usage >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -h /home >>mySysMonitor.log
echo "      ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< $USER Home Status >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
stat /home >>mySysMonitor.log
echo "      ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Root Directory Status >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
stat / >>mySysMonitor.log


# Key Directories Usage~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#space_available_for_user= df -ah ${HOME}/

#download_detailed_usage_list= du -ah $HOME/Downloads
#download_detailed_size= df -ah $HOME/Downloads

#destop_detailed_size= df -ah $HOME/Desktop
#desktop_detailed_size_list= du -ah $HOME/Desktop

#documents_detailed_size= df -ah $HOME/Documents
#documents_detailed_size_list= du -ah $HOME/Documents

#music_detailed_size= df -ah $HOME/Music
#music_detailed_size_list= du -ah $HOME/Music

#pictures_detailed_size= df -ah $HOME/Pictures
#pictures_detailed_size_list= du -ah $HOME/Pictures

#videos_detailed_size= df -ah $HOME/Videos
#videos_detailed_size_list= du -ah $HOME/Videos

#favorites_detailed_size= df -ah $HOME/Favorites
#favorites_detailed_size_list= du -ah $HOME/Favorites

#public_detailed_size= df -ah $HOME/Public
#public_detailed_size_list= du -ah $HOME/Public


$time_stamp2 >>mySysMonitor.log
echo " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< KEY DIRECTORIES FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
date >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "DIRECTORY INFORMATION FOR $HOSTNAME For $USER" >>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Space Available for $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -ah ${HOME}/ >>mySysMonitor.log
echo "    " >>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By DOWNLOADS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -ah ${HOME}/Desktop >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By DESKTOP >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -ah ${HOME}/Desktop >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By DOCUMENTS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -ah ${HOME}/Documents >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By MUSIC >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -ah ${HOME}/Music >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By PICTURES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -ah ${HOME}/Pictures >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By VIDEOS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -ah ${HOME}/Videos >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By FAVORITES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -ah ${HOME}/Favorites >>mySysMonitor.log
echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Disk Usage By PUBLIC >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
df -ah ${HOME}/Public >>mySysMonitor.log


# Installed Applications~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#installed_app_list= dpkg --get-selections
#installed_app_detail= apt list


$time_stamp2 >>mySysMonitor.log

echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< APPLICATIONS INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
date >>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Installed Applications List >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
dpkg --get-selections >>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Installed Applications Details >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
apt list >>mySysMonitor.log


# Current Process~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#formatted_processes= ps -eo pid,ppid,user,cmd

#full_formatted1= ps -eF
#full_formatted2= ps -ef

#root_privelaged_running= ps aux | grep root

#process_as_tree= ps -e --forest

#user_process= ps -u

#all_process_short= ps -A
#all_process_long= ps au

#all_process_list= ps aux

#user_short_process= ps -f
#user_long_process= ps -F


$time_stamp2 >>mySysMonitor.log

echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< PROCESSES INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
date >>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< All Current Processes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
ps au >>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< All Current Processes In Tree >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
ps -e --forest >>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< All User Processes FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
ps -u >>mySysMonitor.log
echo "   ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< All Root Process >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
ps aux | grep root >>mySysMonitor.log


#Ram Details~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#Ram_product_Details= cat /proc/meminfo
#memory_free_short= lshw -short -C memory
#memory_free_long= lshw -C memory
#memory_stats= free -h


$time_stamp2 >>mySysMonitor.log

echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< MEMORY INFORMATION FOR $HOSTNAME FOR $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
date >>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Memory Information >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
free -h >>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< R.A.M INFORMATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
lshw -short -c memory >>mySysMonitor.log

#Top Process~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#User= whoami

#all_process= top -n 10
#user_process= top -n 10 -U $User

#top_13_user_process= top  -n 1 -U $User | head -n 20  | tail -n 13
#top_13_root_process= top  -n 1 -U root | head -n 20  | tail -n 13

#top_13_process= top  -n 1 | head -n 20  | tail -n 13


$time_stamp2 >>mySysMonitor.log

echo "    ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< TOP PROCESSES INFORMATION FOR $HOSTNAME & $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
echo "  ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< TOP 13 Processes for $HOSTNAME >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
top  -b -n 1 | head -n 20  | tail -n 13 >>mySysMonitor.log
echo "  "
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< TOP 13 Processes for $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>">>mySysMonitor.log
top -b -n 1 -U $USER | head -n 20  | tail -n 13 >>mySysMonitor.log
echo "   ">>mySysMonitor.log
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< TOP 13 Root Processes For $USER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ">>mySysMonitor.log
top -b -n 1 -U root | head -n 20  | tail -n 13 >>mySysMonitor.log

echo "*********************************************************************************** END *******************************************************************************************" >>mySysMonitor.log
echo "*********************************************************************************** END *******************************************************************************************" >>mySysMonitor.log
echo "*********************************************************************************** END *******************************************************************************************" >>mySysMonitor.log
echo "*********************************************************************************** END *******************************************************************************************" >>mySysMonitor.log
echo "*********************************************************************************** END *******************************************************************************************" >>mySysMonitor.log

}

#Create WEBPAGE or HTML For the side navigation of the section wise data

{

echo "<html>" >>mySysMonitor.html
echo "<head>" >>mySysMonitor.html
 
echo "<title>MySysMonitor</title>" >>mySysMonitor.html

echo "

<!DOCTYPE html>
<html>
<head>
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<style>
body {
  font-family: \"Lato\", sans-serif;
}
p {
  font-size: 15px;
}
.sidenav {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 15px;
font-weight: bold;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main1 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.main2 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.main3 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.main4 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.main5 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.main6 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.main7 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.main8 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.main9 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.main10 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
text-decoration: none;
}
.main11 {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 15px; /* Increased text to enable scrolling */
  padding: 0px 10px;
font-family: \"Lato\", sans-serif;
text-decoration: none;
}



@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<script>
window.onload = function () {

var chart = new CanvasJS.Chart(\"chartContainer\", {
	theme: \"dark2\",
	exportFileName: \"Doughnut Chart\",
	exportEnabled: true,
	animationEnabled: true,
	title:{
		text: \"RAM MEMORY\"
	},
	legend:{
		cursor: \"pointer\",
		itemclick: explodePie
	},
	data: [{
		type: \"doughnut\",
		innerRadius: 90,
		showInLegend: true,
		toolTipContent: \"<b>{name}</b>: ${y} (#percent%)\",
		indexLabel: \"{name} - #percent%\",
		dataPoints: [
			{ y: $ram_free, name: \"Free\" },
			{ y: $ram_used, name: \"Used\" },
			{ y: $ram_available, name: \"Available\" },
		
		]             
	}]
});
chart.render();

function explodePie (e) {
	if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === \"undefined\" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
		e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
	} else {
		e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
	}
	e.chart.render();
}

}
</script>
">>mySysMonitor.html
echo "<script>
 
  
function myFunction() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");

  if (x.style.display === \"none\") {
    x.style.display = \"block\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  } 
  else {
    x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}

function myFunction1() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");
  if (y.style.display === \"none\") {
    x.style.display = \"none\";
    y.style.display = \"block\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  } 
  else {
    x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}
function myFunction2() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");
  if (z.style.display === \"none\") {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"block\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  } 
  else {
    x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}
function myFunction3() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");
  if (a.style.display === \"none\") {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"block\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  } 
  else {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}
function myFunction4() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");
  if (b.style.display === \"none\") {
       x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"block\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  } 
  else {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}
function myFunction5() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");
  if (c.style.display === \"none\") {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"block\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";  } 
  else {
    x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}
function myFunction6() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");
  if (d.style.display === \"none\") {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"block\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  } 
  else {
    x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}
function myFunction7() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");
  if (e.style.display === \"none\") {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"block\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";  } 
  else {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}
function myFunction8() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");
  if (f.style.display === \"none\") {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"block\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  } 
  else {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}
function myFunction9() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");
  if (g.style.display === \"none\") {
   x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"block\";
    h.style.display = \"none\";
  } 
  else {
    x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}
function myFunction10() {
var x = document.getElementById(\"side_nav1\");
var y = document.getElementById(\"side_nav2\");
var z= document.getElementById(\"side_nav3\");
var a= document.getElementById(\"side_nav4\");
var b = document.getElementById(\"side_nav5\");
var c = document.getElementById(\"side_nav6\");
var d= document.getElementById(\"side_nav7\");
var e= document.getElementById(\"side_nav8\");
var f = document.getElementById(\"side_nav9\");
var g = document.getElementById(\"side_nav10\");
var h= document.getElementById(\"side_nav11\");
  if (h.style.display === \"none\") {
    x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"block\";
  } 
  else {
    x.style.display = \"none\";
    y.style.display = \"none\";
    z.style.display = \"none\";
    a.style.display = \"none\";
 b.style.display = \"none\";
    c.style.display = \"none\";
    d.style.display = \"none\";
    e.style.display = \"none\";
 f.style.display = \"none\";
    g.style.display = \"none\";
    h.style.display = \"none\";
  }
}
function myFunction11() {
window.location.href = \"login.html\";
}
</script>
 <meta http-equiv=\"refresh\" content=\"60\">
</head>" >>mySysMonitor.html

echo "<body>

<div class=\"sidenav\">
  <a onclick=\"myFunction()\">Status</a>
  <a onclick=\"myFunction1()\" >OS</a>
  <a onclick=\"myFunction2()\">Network</a>
  <a onclick=\"myFunction3()\">Users</a>
<a onclick=\"myFunction4()\">USB</a>
  <a onclick=\"myFunction5()\" >Disk Usage</a>
  <a onclick=\"myFunction6()\">Directories</a>
  <a onclick=\"myFunction7()\">Memory</a>
<a onclick=\"myFunction8()\">Top Load</a>
  <a onclick=\"myFunction9()\" >Applications</a>
  <a onclick=\"myFunction10()\">All Processes</a>
<a onclick=\"myFunction11()\">LogOut</a>
</div>

<div class=\"main1\" id=\"side_nav1\" style=\"display: none;\">
  		<p>

<pre>$S_I_N</pre>


		</p>
</div>
<div class=\"main2\" id=\"side_nav2\" style=\"display: none;\">
  <p>
<pre>$Oper_OS</pre>
</p>

</div>
<div class=\"main3\"  id=\"side_nav3\" style=\"display: none;\">
  
  <p>
<pre>$net_int</pre>
</p>
</div>
<div class=\"main4\"  id=\"side_nav4\" style=\"display: none;\">

  <p>
<pre>$userlog</pre>
</p>
</div>

<div class=\"main5\"  id=\"side_nav5\" style=\"display: none;\">

  <p>
<pre>$usbdev</pre>
</p>
</div>
<div class=\"main6\"  id=\"side_nav6\" style=\"display: none;\">

  <p>
<pre>$diskspace</pre>
</p>
</div>
<div class=\"main7\"  id=\"side_nav7\" style=\"display: none;\">

  <p>
<pre>$keydir</pre>
</p>
</div>
<div class=\"main8\"  id=\"side_nav8\" style=\"display: none;\">

  <p>
<pre>$minfo</pre>
</p>
<script src=\"https://canvasjs.com/assets/script/canvasjs.min.js\"></script>
<div id=\"chartContainer\" style=\"height: 370px; width: 100%;\"></div>

</div>
<div class=\"main9\"  id=\"side_nav9\" style=\"display: none;\">

  <p>
<pre>$loadprocess</pre>
</p>
</div>
<div class=\"main10\"  id=\"side_nav10\" style=\"display: none;\">

  <p>
<pre>$appinfo</pre>
</p>
</div>
<div class=\"main11\"  id=\"side_nav11\" style=\"display: none;\">

  <p>
<pre>$process</pre>
</p>
</div>
<div class=\"main12\"  id=\"side_nav12\" style=\"display: none;\">

  <p>
<pre>$process</pre>
</p>
</div>
   
</body>
</html> "
}>>mySysMonitor.html


# HTML source code for Login Page Implementation

echo "<html>
<head>
<title>Login Page</title>
</head>
<body>
<style>
body {
  background-image: url("https://media.giphy.com/media/ZKw0NDn10ljSE/giphy.gif");
  background-color: #cccccc;
}
</style>
<form name=\"loginForm\" method=\"post\" action=\"mySysMonitor.html\">
<table width=\"30%\" height=\"100\" bgcolor=\"0099CC\" align=\"center\">
<tr>
<center><img src="https://image.flaticon.com/icons/svg/429/429331.svg" alt=\"System Monitor\" width=\"500\"
         height=\"500\"></center>
</tr>
<tr>
<td colspan=2><center><font size=25><b>mySysMonitor Login</b></font></center></td>
</tr>
<tr>
<td><b>Username:</b></td>
<td><center><input type=\"text\" size=75 name=\"userid\"></center></td>
</tr>

<tr>
<td><b>Password:</b></td>
<td><center><input type=\"Password\" size=75 name=\"pwd\"></center></td>
</tr>

<tr>
<td ><center><b><input type=\"Reset\"></b></center></td>
<td><center><b><input type=\"submit\" onclick=\"return check(this.form)\" value=\"Login\"></b></center></td>
</tr>

</table>
</form>
<script language=\"javascript\">
function check(form)
{

if(form.userid.value == \"admin\" && form.pwd.value == \"admin\")
{
	
	return true;
}
else
{
	alert(\"Error Password or Username\")
	return false;
}
}
</script>
  
</body>
</html>" >login.html


#opens automatically firefox browser 

firefox login.html

#loop to run the logger function every 10 seconds

while true
do
$(logger)
sleep 10
done

