#!/bin/bash

#Information searching project

function public_ip(){

        echo "The public IP address is $(curl ifconfig.me)"
        }
function private_ip(){
                echo "The Ip address is $(ifconfig | grep "broadcast" | awk '{print $2}' )"
        }
function check_cpu(){
        echo "$(ps -eo pid,%cpu,cmd --sort=-%cpu | head -6 | tail -n +2)"
        echo "***********************************************************"
        echo -e "\n"
        }
function check_disk(){
        echo -e "The memory usage is:\n $(free -h)"
        }

function check_running_service(){
        echo "$(systemctl list-units --type=service --state=running)"
        }

function list_top_file(){
echo -e "List of 10 files \n"
echo "$(du -ah /home | sort -rh | head -n 10)"
        }

function check_mac(){
        echo -e "The Mac address is $(ifconfig | grep 'ether' | awk '{print $2}')"
        }

echo "Please input needed option:"
echo "P: Checking the public IP address"
echo "IP: Checking your Private IP"
echo "DISK: Checking the disk usage"
echo "CPU: Checking the CPU usage"
echo "Service: Checking running services"
echo "Top: Top 10 Largest Files in /home"
echo "MAC: Checking the MAC address of your PC"
echo "ALL: Full information"

echo "**********************************************"
read choice

# Convert the input to lowercase
choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

if [ "$choice" == "p" ]; then
  public_ip
elif [ "$choice" == "ip" ]; then
  private_ip
elif [ "$choice" == "disk" ]; then
  check_disk
elif [ "$choice" == "cpu" ]; then
  check_cpu
elif [ "$choice" == "service" ]; then
  check_running_service
elif [ "$choice" == "top" ]; then
  list_top_file
elif [ "$choice" == "mac" ]; then
  check_mac
elif [ "$choice" == "all" ]; then
    public_ip
        echo "***********************************************************"
        private_ip
        echo "***********************************************************"
        check_cpu
        echo "***********************************************************"
        check_disk
        echo "***********************************************************"
        echo -e "\n"
        check_mac
        echo "***********************************************************"
        echo -e "\n"
        check_running_service
else  
        echo  "Invalid input." 
        fi
    echo "************Good bye************"