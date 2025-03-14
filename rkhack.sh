#!/bin/bash

# PkHacker Tools v5 - Enhanced UI
# A comprehensive collection of penetration testing and security tools
# Coded by RKGroup
# github: https://github.com/RKgroupkg
# Enhanced and optimized version

# Trap Ctrl+C and handle exit gracefully
trap ctrl_c INT
function ctrl_c() {
    clear
    echo -e "${G}[*] ${W}Thanks for using PkHacker Tools!${N}"
    echo -e "${G}[*] ${W}Exiting program...${N}"
    exit 0
}

# Clear the terminal
clear

# Create Tools directory if it doesn't exist
mkdir -p Tools

# Colors with better naming
RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
BLUE="\e[1;34m"
PURPLE="\e[1;35m"
CYAN="\e[1;36m"
WHITE="\e[1;37m"
RESET="\e[0m"

# For compatibility with older code
R="$RED"
G="$GREEN"
Y="$YELLOW"
B="$BLUE"
P="$PURPLE"
C="$CYAN"
W="$WHITE"
N="$RESET"

# Terminal size detection
COLS=$(tput cols)
WIDTH=$((COLS > 100 ? 100 : COLS - 4))

# Version info
VERSION="v5.0"
BUILD_DATE="March 2025"

# Display centered text with improved padding
center_text() {
    local text="$1"
    local color="${2:-$WHITE}"
    local length=${#text}
    local padding=$(( (WIDTH - length) / 2 ))
    printf "${color}%*s%s%*s${RESET}\n" $padding "" "$text" $padding ""
}

# Display bordered text
bordered_text() {
    local text="$1"
    local color="${2:-$WHITE}"
    local border_color="${3:-$PURPLE}"
    local length=${#text}
    local border_line=$(printf '═%.0s' $(seq 1 $((length + 6))))
    
    echo -e "${border_color}╔${border_line}╗${RESET}"
    echo -e "${border_color}║   ${color}${text}${RESET}${border_color}   ║${RESET}"
    echo -e "${border_color}╚${border_line}╝${RESET}"
}

# Display fancy header
display_header() {
    echo
    center_text "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓" "$PURPLE"
    center_text "┃                 RKH4CKER TOOLS $VERSION                ┃" "$RED"
    center_text "┃        ADVANCED SECURITY & PENTESTING SUITE        ┃" "$CYAN"
    center_text "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛" "$PURPLE"
    echo
    center_text "Coded by RKGroup • github.com/RKgroupkg • $BUILD_DATE" "$GREEN"
    echo
}

# Display footer with improved information
display_footer() {
    echo
    center_text "╔═════════════════════════════════════════════════╗" "$BLUE"
    center_text "║  RRESS CTRL+C TO EXIT • PRESS H FOR HELP GUIDE  ║" "$YELLOW"
    center_text "╚═════════════════════════════════════════════════╝" "$BLUE"
    echo
}

# Display menu item with improved formatting
menu_item() {
    local num="$1"
    local text="$2"
    local description="$3"
    
    # Format the number to be two digits with leading zero if needed
    printf "${WHITE}[%02d]${RESET} ${CYAN}%-18s${RESET}" "$num" "$text"
    
    if [ -n "$description" ]; then
        printf " ${YELLOW}• ${WHITE}%s${RESET}" "$description"
    fi
    
    if (( $num % 2 == 0 )); then
        echo
    else
        printf "%-30s" "" # Space between columns
    fi
}

# Improved loading animation with spinner
show_loading() {
    local text="$1"
    local time="${2:-3}"
    local i=0
    local spin=('-' '\' '|' '/')
    
    echo -ne "${PURPLE}$text ${RESET}"
    
    while [ $i -lt $time ]; do
        for s in "${spin[@]}"; do
            echo -ne "${YELLOW}$s${RESET}\b"
            sleep 0.1
        done
        i=$((i + 1))
    done
    echo -e "${GREEN} Done!${RESET}"
}

# Enhanced success message
show_success() {
    echo -e "${GREEN}[✓] ${WHITE}$1${RESET}"
}

# Enhanced info message
show_info() {
    echo -e "${BLUE}[i] ${WHITE}$1${RESET}"
}

# Enhanced warning message
show_warning() {
    echo -e "${YELLOW}[!] ${WHITE}$1${RESET}"
}

# Enhanced error message
show_error() {
    echo -e "${RED}[✗] ${WHITE}$1${RESET}"
}

# Function to return to main menu with countdown
return_to_menu() {
    echo
    show_success "Operation completed successfully!"
    echo -ne "${YELLOW}[i] ${WHITE}Returning to main menu in 3${RESET}"
    for i in {2..1}; do
        sleep 1
        echo -ne "${YELLOW}, ${i}${RESET}"
    done
    sleep 1
    echo -e "${YELLOW}, Launching!${RESET}"
    exec bash "$0"
}

# Check if a tool is already installed
check_tool() {
    local tool_dir="$1"
    if [ -d "Tools/$tool_dir" ]; then
        show_info "Tool already installed. Starting..."
        return 0
    else
        return 1
    fi
}

# Verify internet connection
check_internet() {
    show_loading "Checking internet connection" 1
    if ping -c 1 8.8.8.8 &>/dev/null; then
        show_success "Internet connection available"
        return 0
    else
        show_error "No internet connection. Tools require internet access."
        return 1
    fi
}

# Display comprehensive help guide
display_help_guide() {
    clear
    center_text "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓" "$PURPLE"
    center_text "┃           COMPREHENSIVE HELP GUIDE               ┃" "$GREEN"
    center_text "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛" "$PURPLE"
    echo
    
    echo -e "${CYAN}ABOUT THIS TOOLKIT:${RESET}"
    echo -e "  RkHacker Tools is a comprehensive collection of security and penetration"
    echo -e "  testing tools designed for educational purposes and ethical use only."
    echo
    
    echo -e "${CYAN}TOOL CATEGORIES:${RESET}"
    echo -e "  ${WHITE}• Information Gathering${RESET} - Tools to collect data about targets"
    echo -e "  ${WHITE}• Web Vulnerability Scanning${RESET} - Identify website vulnerabilities"
    echo -e "  ${WHITE}• Phishing & Social Engineering${RESET} - For security awareness testing"
    echo -e "  ${WHITE}• Network Analysis${RESET} - Examine network traffic and security"
    echo -e "  ${WHITE}• System Security${RESET} - Tools to test and strengthen system security"
    echo
    
    echo -e "${CYAN}USAGE INSTRUCTIONS:${RESET}"
    echo -e "  ${WHITE}1.${RESET} Start by running option 1 (Requirements & Update)"
    echo -e "  ${WHITE}2.${RESET} Select a tool by entering its number"
    echo -e "  ${WHITE}3.${RESET} Follow the on-screen instructions for each tool"
    echo -e "  ${WHITE}4.${RESET} Press CTRL+C at any time to exit the current tool"
    echo
    
    echo -e "${CYAN}TOOL DESCRIPTIONS:${RESET}"
    echo -e "  ${WHITE}• Zphisher:${RESET} Advanced phishing tool with 30+ templates"
    echo -e "  ${WHITE}• CamPhish:${RESET} Camera phishing tool for security awareness"
    echo -e "  ${WHITE}• Subscan:${RESET} Subdomain scanner for website reconnaissance"
    echo -e "  ${WHITE}• DDoS-Ripper:${RESET} DDoS attack simulation tool"
    echo -e "  ${WHITE}• IP Tracker:${RESET} Tool for IP address information gathering"
    echo -e "  ${WHITE}• RED_HAWK:${RESET} All-in-one tool for Information Gathering and Vulnerability Scanning"
    echo -e "  ${WHITE}• Dorks-Eye:${RESET} Tool to find Google dorks for vulnerability research"
    echo -e "  ${WHITE}• Auto-IP-Changer:${RESET} Changes your IP address automatically using Tor"
    echo
    
    echo -e "${CYAN}SECURITY RECOMMENDATIONS:${RESET}"
    echo -e "  ${WHITE}• Use VPN${RESET} for anonymity during security tests"
    echo -e "  ${WHITE}• Always obtain proper authorization${RESET} before testing any systems"
    echo -e "  ${WHITE}• Keep tools updated${RESET} with the latest security patches"
    echo -e "  ${WHITE}• Document all activities${RESET} during authorized security testing"
    echo -e "  ${WHITE}• Report vulnerabilities responsibly${RESET} to system owners"
    echo
    
    echo -e "${CYAN}LEGAL DISCLAIMER:${RESET}"
    echo -e "  These tools are provided for educational purposes and legitimate security"
    echo -e "  testing only. Unauthorized use against systems without explicit permission"
    echo -e "  is illegal and unethical. Users are solely responsible for their actions."
    echo
    
    echo -e "${YELLOW}Press ENTER to return to the main menu...${RESET}"
    read -r
    exec bash "$0"
}

# Display main menu with enhanced formatting and organization
display_menu() {
    display_header
    
    center_text "《 ESSENTIAL TOOLS 》" "$YELLOW"
    menu_item "1" "Setup & Update" "Install"
    menu_item "2" "Zphisher" "Phishing"
    menu_item "3" "CamPhish" "Camera Hack"
    menu_item "4" "Subscan" "Scanner"
    echo
    
    center_text "《 NETWORK & WEB TOOLS 》" "$YELLOW"
    menu_item "5" "Fast Mail Bomber" "Email ddos"
    menu_item "6" "DDoS-Ripper" "DDoS attack"
    menu_item "7" "Help Guide" "Usage guide"
    menu_item "8" "Uninstall Tools" " "
    echo
    
    center_text "《 INFORMATION GATHERING 》" "$YELLOW"
    menu_item "9" "IP Tracker" "IP information"
    menu_item "10" "Dorks-Eye" "Dorks tool"
    menu_item "11" "HackerPro" "Hacking tool"
    menu_item "12" "RED_HAWK" "vuln- scanner"
    echo
    
    center_text "《 ADVANCED TOOLS 》" "$YELLOW"
    menu_item "13" "VirusCrafter" "Create virus"
    menu_item "14" "Info-Site" "Website info"
    menu_item "15" "BadMod" "CMS vuln- scan"
    menu_item "16" "Facebash" "Facebook brute"
    menu_item "17" "DARKARMY" "Penetration"
    menu_item "18" "AUTO-IP-CHANGER" "Auto IP "
    echo
    
    display_footer
}

# Show title for tool installation with improved styling
show_title() {
    clear
    bordered_text "$1" "$RED" "$PURPLE"
    echo
}

# Enhanced disclaimer function
show_disclaimer() {
    clear
    center_text "╔═════════════════════════════════════════════════╗" "$RED"
    center_text "║              SECURITY DISCLAIMER                ║" "$RED"
    center_text "╚═════════════════════════════════════════════════╝" "$RED"
    echo
    
    echo -e "${YELLOW}IMPORTANT NOTICE:${RESET}"
    echo -e "${WHITE}• These tools are provided for ${RED}EDUCATIONAL PURPOSES ONLY${RESET}"
    echo -e "${WHITE}• Use ${GREEN}RESPONSIBLY${WHITE} and ${GREEN}LEGALLY${RESET}"
    echo -e "${WHITE}• ${RED}NEVER${WHITE} use against systems without ${GREEN}EXPLICIT PERMISSION${RESET}"
    echo -e "${WHITE}• You are ${RED}SOLELY RESPONSIBLE${WHITE} for your actions${RESET}"
    echo -e "${WHITE}• Misuse may lead to ${RED}CRIMINAL CHARGES${WHITE} and legal consequences${RESET}"
    echo
    
    echo -e "${YELLOW}Do you understand and agree to use these tools ethically? (y/n)${RESET}"
    read -p "➜ " confirm
    
    if [[ "$confirm" != [yY] && "$confirm" != [yY][eE][sS] ]]; then
        echo -e "${RED}You must agree to continue. Exiting program.${RESET}"
        exit 1
    fi
}

# Main program execution

# Display main menu
display_menu

# Option Selection with improved error handling
echo
echo -ne "${GREEN}➜ ${WHITE}Enter option number (or 'h' for help): ${RESET}"
read option

# Handle help directly
if [[ "$option" == [hH] ]]; then
    display_help_guide
    exit 0
fi

# Show disclaimer before proceeding
show_disclaimer

# Handle numeric options
case $option in
    1|01)
        show_title "Requirements & Updates"
        show_loading "Preparing system update" 2
        
        show_info "Updating package lists..."
        pkg update -y
        
        show_info "Installing Git..."
        pkg install git -y
        
        show_info "Installing Python..."
        pkg install python python3 -y
        
        show_info "Installing pip..."
        pkg install pip pip3 -y
        
        show_info "Installing curl..."
        pkg install curl -y
        
        show_info "Installing additional requirements..."
        pkg install php wget openssl -y
        
        show_info "Upgrading packages..."
        pkg upgrade -y
        
        show_success "System update complete! All requirements installed."
        return_to_menu
        ;;
    2|02)
        show_title "Zphisher - Advanced Phishing Tool"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_loading "Setting up Zphisher" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        if check_tool "zphisher"; then
            cd zphisher
        else
            show_info "Cloning repository..."
            git clone --depth=1 https://github.com/htr-tech/zphisher
            cd zphisher || exit
            
            show_success "Installation completed!"
            show_info "Zphisher is a phishing tool with 30+ templates"
            show_info "Use for security awareness testing only"
        fi
        bash zphisher.sh
        ;;
    3|03)
        show_title "CamPhish - WebCam Hack Tool"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_loading "Setting up CamPhish" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        if check_tool "CamPhish"; then
            cd CamPhish
        else
            show_info "Cloning repository..."
            git clone https://github.com/techchipnet/CamPhish
            cd CamPhish || exit
            
            show_success "Installation completed!"
            show_info "CamPhish can be used for testing camera security"
            show_info "Always use with proper authorization"
        fi
        bash camphish.sh
        ;;
    4|04)
        show_title "Subscan - Fast Subdomain Scanner"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_loading "Setting up Subscan" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        if check_tool "subscan"; then
            cd subscan
        else
            show_info "Cloning repository..."
            git clone https://github.com/zidansec/subscan
            cd subscan || exit
            chmod +x subscan
            
            show_success "Installation completed!"
        fi
        
        echo
        echo -e "${BLUE}╔═══════════════════════════════════════╗${RESET}"
        echo -e "${BLUE}║           DOMAIN SCANNING            ║${RESET}"
        echo -e "${BLUE}╚═══════════════════════════════════════╝${RESET}"
        echo
        echo -e "${WHITE}Enter a domain to scan (e.g. example.com):${RESET}"
        read -p "➜ " domain
        
        if [[ -z "$domain" ]]; then
            show_error "No domain entered. Returning to menu."
            return_to_menu
        fi
        
        show_info "Scanning $domain for subdomains..."
        ./subscan "$domain"
        return_to_menu
        ;;
    5|05)
        show_title "Fast Mail Bomber - Email Testing Tool"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_warning "This tool is for testing email systems only"
        show_warning "Misuse may violate laws in your country"
        echo
        echo -e "${YELLOW}Do you want to proceed? (y/n)${RESET}"
        read -p "➜ " confirm
        
        if [[ "$confirm" != [yY] && "$confirm" != [yY][eE][sS] ]]; then
            show_info "Operation canceled. Returning to menu."
            return_to_menu
        fi
        
        show_loading "Setting up Fast Mail Bomber" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        if check_tool "fast-mail-bomber"; then
            cd fast-mail-bomber
        else
            show_info "Cloning repository..."
            git clone https://github.com/juzeon/fast-mail-bomber.git
            cd fast-mail-bomber || exit
            mv config.example.php config.php
        fi
        
        show_warning "This installation will take a lot of time"
        show_warning "To stop press Ctrl+C"
        sleep 2
        
        php index.php update-providers
        rm -rf data/nodes.json data/dead_providers.json
        php index.php update-nodes
        php index.php refine-nodes
        
        echo
        echo -e "${WHITE}Enter an email address to test:${RESET}"
        read -p "➜ " email
        
        if [[ -z "$email" ]]; then
            show_error "No email entered. Returning to menu."
            return_to_menu
        fi
        
        php index.php start-bombing "$email"
        return_to_menu
        ;;
    6|06)
        show_title "DDoS-Ripper - Network Testing Tool"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_warning "This tool is for authorized testing only"
        show_warning "Unauthorized DDoS attacks are illegal worldwide"
        show_warning "Use a VPN and proper authorization before testing"
        echo
        echo -e "${RED}Are you using this tool legally with authorization? (y/n)${RESET}"
        read -p "➜ " confirm
        
        if [[ "$confirm" != [yY] && "$confirm" != [yY][eE][sS] ]]; then
            show_info "Operation canceled. Returning to menu."
            return_to_menu
        fi
        
        show_loading "Setting up DDoS-Ripper" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        if check_tool "DDoS-Ripper"; then
            cd DDoS-Ripper
        else
            show_info "Cloning repository..."
            git clone https://github.com/palahsu/DDoS-Ripper.git
            cd DDoS-Ripper || exit
        fi
        
        python3 DRipper.py
        return_to_menu
        ;;
    7|07)
        display_help_guide
        ;;
    8|08)
        show_title "Uninstall Tools - Clean System"
        show_loading "Preparing cleanup" 2
        
        echo -e "${RED}⚠ WARNING: This will remove ALL downloaded tools!${RESET}"
        echo -e "${YELLOW}This action cannot be undone. Are you sure? (yes/no)${RESET}"
        read -p "➜ " confirm
        
        if [[ "$confirm" == "yes" ]]; then
            show_info "Removing all tools..."
            rm -rf Tools
            show_success "All downloaded tools have been removed."
        else
            show_info "Uninstall canceled."
        fi
        return_to_menu
        ;;
    9|09)
        show_title "IP Tracker - Information Gathering Tool"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_loading "Setting up IP Tracker" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        show_info "Updating packages..."
        apt update
        show_info "Installing requirements..."
        apt install git curl -y
        
        if check_tool "track-ip"; then
            cd track-ip
        else
            show_info "Cloning repository..."
            git clone https://github.com/htr-tech/track-ip.git
            cd track-ip || exit
        fi
        bash trackip
        return_to_menu
        ;;
    10|010)
        show_title "Dorks-Eye - Google Dorks Finder"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_loading "Setting up Dorks-Eye" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        if check_tool "dorks-eye"; then
            cd dorks-eye
        else
            show_info "Cloning repository..."
            git clone https://github.com/BullsEye0/dorks-eye.git
            cd dorks-eye || exit
            show_info "Installing requirements..."
            pip install -r requirements.txt
        fi
        python3 dorks-eye.py
        return_to_menu
        ;;
    11|011)
        show_title "HackerPro - All-In-One Toolkit"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_loading "Setting up HackerPro" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        show_info "Updating packages..."
        apt update && apt upgrade -y
        show_info "Installing requirements..."
        apt install git python2 -y
        
        if check_tool "hackerpro"; then
            cd hackerpro
        else
            show_info "Cloning repository..."
            git clone https://github.com/jaykali/hackerpro.git
            cd hackerpro || exit
            bash install.sh
        fi
        python2 hackerpro.py
        return_to_menu
        ;;
    12|012)
        show_title "RED_HAWK - Website Vulnerability Scanner"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_loading "Setting up RED_HAWK" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        if check_tool "RED_HAWK"; then
            cd RED_HAWK
        else
            show_info "Cloning repository..."
            git clone https://github.com/Tuhinshubhra/RED_HAWK
            cd RED_HAWK || exit
        fi
        php rhawk.php
        return_to_menu
        ;;
    13|013)
        show_title "TigerVirus - Virus Creation Tool for Testing"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_warning "This tool is for educational purposes only"
        show_warning "Created viruses can cause actual damage to systems"
        show_warning "Only use in isolated testing environments"
        echo
        echo -e "${RED}Do you confirm to use this responsibly? (yes/no)${RESET}"
        read -p "➜ " confirm
        
        if [[ "$confirm" != "yes" ]]; then
            show_info "Operation canceled. Returning to menu."
            return_to_menu
        fi
        
        show_loading "Setting up TigerVirus" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        show_info "Updating packages..."
        apt update
        apt upgrade -y
        show_info "Installing requirements..."
        pkg install git -y
        
        if check_tool "TigerVirus"; then
            cd TigerVirus
        else
            show_info "Cloning repository..."
            git clone https://github.com/Devil-Tigers/TigerVirus
            cd TigerVirus || exit
        fi
        bash app.sh
        return_to_menu
        ;;
    14|014)
        show_title "Info-Site - Website Analysis Tool"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_loading "Setting up Info-Site" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        show_info "Installing requirements..."
        pkg install curl -y
        apt upgrade -y
        pkg install git -y
        
        if check_tool "info-site"; then
            cd info-site
        else
            show_info "Cloning repository..."
            git clone https://github.com/king-hacking/info-site.git
            cd info-site || exit
        fi
        bash info.sh
        return_to_menu
        ;;
    15|015)
        show_title "BadMod - CMS Vulnerability Scanner"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_loading "Setting up BadMod" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        show_info "Updating packages..."
        apt-get update
        show_info "Installing requirements..."
        apt-get install php php-curl -y
        
        if check_tool "BadMod"; then
            cd BadMod
        else
            show_info "Cloning repository..."
            git clone https://github.com/MrSqar-Ye/BadMod.git
            cd BadMod || exit
            chmod u+x INSTALL
            chmod u+x BadMod.php
        fi
        php BadMod.php
        return_to_menu
        ;;
    16|016)
        show_title "Facebash - Facebook Security Testing Tool"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_warning "This tool is for ethical security testing only"
        show_warning "Unauthorized access to accounts is illegal"
        echo
        echo -e "${RED}Do you have proper authorization to test? (yes/no)${RESET}"
        read -p "➜ " confirm
        
        if [[ "$confirm" != "yes" ]]; then
            show_info "Operation canceled. Returning to menu."
            return_to_menu
        fi
        
        show_loading "Setting up Facebash" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        if check_tool "facebash"; then
            cd facebash
        else
            show_info "Cloning repository..."
            git clone https://github.com/fu8uk1/facebash
            cd facebash || exit
            bash install.sh
            chmod +x facebash.sh
        fi
        
        # Start Tor service first
        show_info "Starting Tor service..."
        service tor start || systemctl start tor
        ./facebash.sh
        return_to_menu
        ;;
    17|017)
        show_title "DARKARMY - Penetration Testing Framework"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_loading "Setting up DARKARMY" 2
        
        cd Tools || mkdir -p Tools && cd Tools
        show_info "Installing requirements..."
        pkg install git python2 -y
        
        if check_tool "DARKARMY"; then
            cd DARKARMY
        else
            show_info "Cloning repository..."
            git clone https://github.com/D4RK-4RMY/DARKARMY
            cd DARKARMY || exit
            chmod +x darkarmy.py
        fi
        python2 darkarmy.py
        return_to_menu
        ;;
    18|018)
        show_title "Auto Tor IP Changer - Anonymity Tool"
        
        if ! check_internet; then
            return_to_menu
        fi
        
        show_warning "This tool requires ROOT privileges"
        
        cd Tools || mkdir -p Tools && cd Tools
        show_info "Installing requirements..."
        apt-get install tor -y
        pip3 install requests
        
        if check_tool "Auto_Tor_IP_changer"; then
            cd Auto_Tor_IP_changer
        else
            show_info "Cloning repository..."
            git clone https://github.com/FDX100/Auto_Tor_IP_changer.git
            cd Auto_Tor_IP_changer || exit
            python3 install.py
        fi
        
        show_info "Configure your browser's proxy settings to use SOCKS proxy 127.0.0.1:9050"
        sleep 5
        aut
        return_to_menu
        ;;
    *)
        clear
        show_error "Invalid option selected. Please try again."
        sleep 2
        exec bash "$0"
        ;;
esac