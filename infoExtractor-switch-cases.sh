#!/bin/bash

#INFO-EXTRACTOR PROJECT FILE

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


function handle_input(){
        echo "Choose the needed information option:"
        echo "public: Checking the public IP address"
        echo "private: Checking your Private IP"
        echo "disk: Checking the disk/memory usage"
        echo "cpu: Checking the CPU usage"
        echo "services: Checking running services"
        echo "top: Top 10 Largest Files in /home"
        echo "mac: Checking the MAC address of your PC"
        echo "all: Full information"

        echo "**********************************************"
        read choice

        choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

case $choice in
    public)
        public_ip
        ;;
    private)
        private_ip
        ;;
    cpu)
        check_cpu
        ;;
    disk)
        check_disk
        ;;
    services)
        check_running_service
        ;;
    all)
        check_running_service
        ;;
    all)
        public_ip
        echo -e "\n\n"

        private_ip
        echo -e "\n\n"

        check_cpu
        echo -e "\n\n"

        check_disk
        echo -e "\n\n"

        check_mac
        echo -e "\n\n"

        echo -e "\n"
        check_running_service        
        ;;
      *)
        echo  "Invalid input." 
        ;;
        esac
}

        handle_input
        
while true; do
            echo "Want to continue? [Y/N]: "
            read -r answer
        if [ -z "$answer" ]; then
                answer="y"
        else
           answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
        fi
    case $answer in
        y)
        handle_input
        ;;
        n)
        echo "Program exit..."
        break
        ;;
        *)
            echo "Invalid input. Exitting..."
            break
            ;;
    esac
done

echo "************Happy Bashing************"