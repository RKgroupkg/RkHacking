#!/bin/bash

# PkHacker Tools v4 - Improved UI
# A collection of penetration testing and security tools
# Coded by RKGroup
# github: https://github.com/RKgroupkg
# UI Enhanced version

# Clear the terminal
clear

# Create Tools directory if it doesn't exist
mkdir -p Tools

# Colors
R="\e[1;31m"  # Red
G="\e[1;32m"  # Green
Y="\e[1;33m"  # Yellow
B="\e[1;34m"  # Blue
P="\e[1;35m"  # Purple
C="\e[1;36m"  # Cyan
W="\e[1;37m"  # White
N="\e[0m"     # Reset

# Terminal size
COLS=$(tput cols)
WIDTH=$((COLS > 80 ? 80 : COLS - 4))

# Display centered text
center_text() {
    local text="$1"
    local color="$2"
    local padding=$(( (WIDTH - ${#text}) / 2 ))
    printf "${color}%*s%s%*s${N}\n" $padding "" "$text" $padding ""
}

# Display header
display_header() {
    echo
    center_text "╔═════════════════════════════════════════════════╗" "$P"
    center_text "║               RK HACKER TOOLS V4                ║" "$R"
    center_text "╚═════════════════════════════════════════════════╝" "$P"
    echo
    center_text "Coded by RKGroup • github: github.com/RKgroupkg" "$G"
    echo
}

# Display footer
display_footer() {
    echo
    center_text "Press CTRL+C to exit at any time" "$Y"
    echo
}

# Display menu item
menu_item() {
    local num="$1"
    local text="$2"
    printf "${W}[${num}]${N} ${C}%-30s${N}" " $text"
    if (( $num % 2 == 0 )); then
        echo
    fi
}

# Display loading animation
show_loading() {
    local text="$1"
    echo -ne "${P}$text ${N}"
    for i in {1..3}; do
        echo -ne "${Y}.${N}"
        sleep 0.3
    done
    echo
}

# Function to return to main menu
return_to_menu() {
    echo
    echo -e "${G}✓ Operation completed.${N}"
    echo -e "${Y}➜ Returning to main menu in 3 seconds...${N}"
    sleep 3
    exec bash "$0"
}

# Display main menu
display_menu() {
    display_header
    
    menu_item "1" "Requirements & Update"
    menu_item "2" "Phishing Tool"
    menu_item "3" "WebCam Hack"
    menu_item "4" "Subscan"
    menu_item "5" "Gmail Bomber"
    menu_item "6" "DDOS Attack"
    menu_item "7" "How to use?"
    menu_item "8" "Uninstall Tools"
    menu_item "9" "IP Info"
    menu_item "10" "Dorks-Eye"
    menu_item "11" "HackerPro"
    menu_item "12" "RED_HAWK"
    menu_item "13" "VirusCrafter"
    menu_item "14" "Info-Site"
    menu_item "15" "BadMod"
    menu_item "16" "Facebash"
    menu_item "17" "DARKARMY"
    menu_item "18" "AUTO-IP-CHANGER"
    
    display_footer
}

# Show title for tool installation
show_title() {
    clear
    center_text "╔═════════════════════════════════════════════════╗" "$P"
    center_text "║ $1" "║" "$R"
    center_text "╚═════════════════════════════════════════════════╝" "$P"
    echo
}

# Disclaimer function
show_disclaimer() {
    clear
    center_text "╔═════════════════════════════════════════════════╗" "$R"
    center_text "║               SECURITY DISCLAIMER               ║" "$R"
    center_text "╚═════════════════════════════════════════════════╝" "$R"
    echo
    echo -e "${Y}➜ Tools provided for educational purposes only${N}"
    echo -e "${Y}➜ Use responsibly and legally${N}"
    echo -e "${Y}➜ Never use against systems without permission${N}"
    echo -e "${Y}➜ You are responsible for your actions${N}"
    echo
    read -p "Press Enter to continue..."
}

# Display main menu
display_menu

# Option Selection
echo
echo -ne "${G}➜ ${W}Enter option number: ${N}"
read option

# Show disclaimer before proceeding
show_disclaimer

case $option in
    1|01)
        show_title "Requirements & Updates"
        show_loading "Installing updates and requirements"
        
        echo -e "${B}➜ Updating package lists...${N}"
        pkg update -y
        
        echo -e "${B}➜ Installing Git...${N}"
        pkg install git -y
        
        echo -e "${B}➜ Installing Python...${N}"
        pkg install python python3 -y
        
        echo -e "${B}➜ Installing pip...${N}"
        pkg install pip pip3 -y
        
        echo -e "${B}➜ Installing curl...${N}"
        pkg install curl -y
        
        echo -e "${B}➜ Upgrading packages...${N}"
        pkg upgrade -y
        
        echo -e "${G}✓ Update complete!${N}"
        return_to_menu
        ;;
    2|02)
        show_title "Zphisher - Phishing Tool"
        show_loading "Setting up Zphisher"
        
        cd Tools || mkdir -p Tools && cd Tools
        if [ -d "zphisher" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd zphisher
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/htr-tech/zphisher
            cd zphisher || exit
        fi
        bash zphisher.sh
        ;;
    3|03)
        show_title "CamPhish - WebCam Hack Tool"
        show_loading "Setting up CamPhish"
        
        cd Tools || mkdir -p Tools && cd Tools
        if [ -d "CamPhish" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd CamPhish
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/techchipnet/CamPhish
            cd CamPhish || exit
        fi
        bash camphish.sh
        ;;
    4|04)
        show_title "Subscan - Subdomain Scanner"
        show_loading "Setting up Subscan"
        
        cd Tools || mkdir -p Tools && cd Tools
        if [ -d "subscan" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd subscan
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/zidansec/subscan
            cd subscan || exit
        fi
        
        echo
        echo -e "${W}Enter a domain to scan (e.g. example.com):${N}"
        read -p "➜ " domain
        ./subscan "$domain"
        return_to_menu
        ;;
    5|05)
        show_title "Fast Mail Bomber"
        show_loading "Setting up Fast Mail Bomber"
        
        cd Tools || mkdir -p Tools && cd Tools
        if [ -d "fast-mail-bomber" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd fast-mail-bomber
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/juzeon/fast-mail-bomber.git
            cd fast-mail-bomber || exit
            mv config.example.php config.php
        fi
        
        echo -e "${Y}⚠ Warning: This installation will take a lot of time${N}"
        echo -e "${Y}⚠ To stop press Ctrl+C${N}"
        sleep 2
        
        php index.php update-providers
        rm -rf data/nodes.json data/dead_providers.json
        php index.php update-nodes
        php index.php refine-nodes
        
        echo
        echo -e "${W}Enter an email address to bomb:${N}"
        read -p "➜ " email
        php index.php start-bombing "$email"
        return_to_menu
        ;;
    6|06)
        show_title "DDoS-Ripper"
        show_loading "Setting up DDoS-Ripper"
        
        cd Tools || mkdir -p Tools && cd Tools
        if [ -d "DDoS-Ripper" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd DDoS-Ripper
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/palahsu/DDoS-Ripper.git
            cd DDoS-Ripper || exit
        fi
        
        echo -e "${R}⚠ Warning: Before using, hide your IP using a VPN${N}"
        sleep 3
        python3 DRipper.py
        return_to_menu
        ;;
    7|07)
        show_title "How to use?"
        show_loading "Opening tutorial"
        
        echo -e "${B}➜ Opening YouTube tutorial...${N}"
        python3 -m webbrowser "https://www.youtube.com/watch?v=zgdq6ErscqY"
        echo -e "${Y}➜ Waiting 10 seconds before returning to menu...${N}"
        sleep 10
        return_to_menu
        ;;
    8|08)
        show_title "Uninstall Tools"
        show_loading "Cleaning up"
        
        echo -e "${R}⚠ WARNING: This will remove ALL downloaded tools!${N}"
        echo -e "${Y}➜ Are you sure you want to continue? (y/n)${N}"
        read -p "➜ " confirm
        
        if [[ "$confirm" == [yY] || "$confirm" == [yY][eE][sS] ]]; then
            echo -e "${B}➜ Removing all tools...${N}"
            rm -rf Tools
            echo -e "${G}✓ All downloaded tools have been removed.${N}"
        else
            echo -e "${G}✓ Uninstall canceled.${N}"
        fi
        return_to_menu
        ;;
    9|09)
        show_title "IP Tracker"
        show_loading "Setting up IP Tracker"
        
        cd Tools || mkdir -p Tools && cd Tools
        echo -e "${B}➜ Updating packages...${N}"
        apt update
        echo -e "${B}➜ Installing requirements...${N}"
        apt install git curl -y
        
        if [ -d "track-ip" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd track-ip
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/htr-tech/track-ip.git
            cd track-ip || exit
        fi
        bash trackip
        return_to_menu
        ;;
    10|010)
        show_title "Dorks-Eye"
        show_loading "Setting up Dorks-Eye"
        
        cd Tools || mkdir -p Tools && cd Tools
        if [ -d "dorks-eye" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd dorks-eye
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/BullsEye0/dorks-eye.git
            cd dorks-eye || exit
            echo -e "${B}➜ Installing requirements...${N}"
            pip install -r requirements.txt
        fi
        python3 dorks-eye.py
        return_to_menu
        ;;
    11|011)
        show_title "HackerPro"
        show_loading "Setting up HackerPro"
        
        cd Tools || mkdir -p Tools && cd Tools
        echo -e "${B}➜ Updating packages...${N}"
        apt update && apt upgrade -y
        echo -e "${B}➜ Installing requirements...${N}"
        apt install git python2 -y
        
        if [ -d "hackerpro" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd hackerpro
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/jaykali/hackerpro.git
            cd hackerpro || exit
            bash install.sh
        fi
        python2 hackerpro.py
        return_to_menu
        ;;
    12|012)
        show_title "RED_HAWK"
        show_loading "Setting up RED_HAWK"
        
        cd Tools || mkdir -p Tools && cd Tools
        if [ -d "RED_HAWK" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd RED_HAWK
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/Tuhinshubhra/RED_HAWK
            cd RED_HAWK || exit
        fi
        php rhawk.php
        return_to_menu
        ;;
    13|013)
        show_title "TigerVirus"
        show_loading "Setting up TigerVirus"
        
        cd Tools || mkdir -p Tools && cd Tools
        echo -e "${B}➜ Updating packages...${N}"
        apt update
        apt upgrade -y
        echo -e "${B}➜ Installing requirements...${N}"
        pkg install git -y
        
        if [ -d "TigerVirus" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd TigerVirus
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/Devil-Tigers/TigerVirus
            cd TigerVirus || exit
        fi
        bash app.sh
        return_to_menu
        ;;
    14|014)
        show_title "Info-Site"
        show_loading "Setting up Info-Site"
        
        cd Tools || mkdir -p Tools && cd Tools
        echo -e "${B}➜ Installing requirements...${N}"
        pkg install curl -y
        apt upgrade -y
        pkg install git -y
        
        if [ -d "info-site" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd info-site
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/king-hacking/info-site.git
            cd info-site || exit
        fi
        bash info.sh
        return_to_menu
        ;;
    15|015)
        show_title "BadMod"
        show_loading "Setting up BadMod"
        
        cd Tools || mkdir -p Tools && cd Tools
        echo -e "${B}➜ Updating packages...${N}"
        apt-get update
        echo -e "${B}➜ Installing requirements...${N}"
        apt-get install php php-curl -y
        
        if [ -d "BadMod" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd BadMod
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/MrSqar-Ye/BadMod.git
            cd BadMod || exit
            chmod u+x INSTALL
            chmod u+x BadMod.php
        fi
        php BadMod.php
        return_to_menu
        ;;
    16|016)
        show_title "Facebash"
        show_loading "Setting up Facebash"
        
        cd Tools || mkdir -p Tools && cd Tools
        if [ -d "facebash" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd facebash
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/fu8uk1/facebash
            cd facebash || exit
            bash install.sh
            chmod +x facebash.sh
        fi
        
        # Start Tor service first
        echo -e "${B}➜ Starting Tor service...${N}"
        service tor start || systemctl start tor
        ./facebash.sh
        return_to_menu
        ;;
    17|017)
        show_title "DARKARMY"
        show_loading "Setting up DARKARMY"
        
        cd Tools || mkdir -p Tools && cd Tools
        echo -e "${B}➜ Installing requirements...${N}"
        pkg install git python2 -y
        
        if [ -d "DARKARMY" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd DARKARMY
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/D4RK-4RMY/DARKARMY
            cd DARKARMY || exit
            chmod +x darkarmy.py
        fi
        python2 darkarmy.py
        return_to_menu
        ;;
    18|018)
        show_title "Auto Tor IP Changer"
        show_loading "Setting up Auto Tor IP Changer"
        
        echo -e "${R}⚠ This tool requires ROOT privileges${N}"
        
        cd Tools || mkdir -p Tools && cd Tools
        echo -e "${B}➜ Installing requirements...${N}"
        apt-get install tor -y
        pip3 install requests
        
        if [ -d "Auto_Tor_IP_changer" ]; then
            echo -e "${Y}➜ Tool already installed. Starting...${N}"
            cd Auto_Tor_IP_changer
        else
            echo -e "${B}➜ Cloning repository...${N}"
            git clone https://github.com/FDX100/Auto_Tor_IP_changer.git
            cd Auto_Tor_IP_changer || exit
            python3 install.py
        fi
        
        echo -e "${Y}⚠ Configure your browser's proxy settings to use SOCKS proxy 127.0.0.1:9050${N}"
        sleep 5
        aut
        return_to_menu
        ;;
    *)
        clear
        echo -e "${R}✗ Invalid option selected. Please try again.${N}"
        sleep 2
        exec bash "$0"
        ;;
esac