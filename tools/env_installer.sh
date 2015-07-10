#!/usr/bin/env bash

# Reset
NC='\033[0m'              # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# ~/Project/ProjectName
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# ~/Project
__parent="$(cd "$(dirname "${__dir}")" && pwd)"
# ~/Project/ProjectName/script.sh
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
# script
__scriptName="$(basename ${__file} .sh)"

main () {
    local work_dir=$(mktemp -d)
    local haxe_installer_url=http://www.openfl.org/builds/haxe/haxe-latest-linux-installer.tar.gz
    local haxe_installer="haxe.tar.gz"

    cd ${work_dir}

    echo -e "${BYellow}"
    echo -e "+-----------------------------------------+"
    echo -e "| -> Downloading latest Haxe installer <- |"
    echo -e "+-----------------------------------------+"
    echo -e "${NC}"
    wget -O haxe.tar.gz ${haxe_installer_url} || false

    echo -e "${BYellow}"
    echo -e "+-----------------------+"
    echo -e "| -> Installing Haxe <- |"
    echo -e "+-----------------------+"
    echo -e "${NC}"
    tar xf ${haxe_installer} && bash *.sh || false

    echo -e "${BYellow}"
    echo -e "+-------------------------+"
    echo -e "| -> Installing OpenFL <- |"
    echo -e "+-------------------------+"
    echo -e "${NC}"
    haxelib install openfl || false
    haxelib run openfl setup || false
    openfl || false

    echo -e "${BYellow}"
    echo -e "+-----------------------------+"
    echo -e "| -> Installing HaxeFlixel <- |"
    echo -e "+-----------------------------+"
    echo -e "${NC}"
    haxelib install flixel || false
    haxelib install flixel-tools || false
    haxelib install firetongue || false
    haxelib run flixel-tools setup || false
    flixel || false

    echo -e "${BYellow}"
    echo -e "+--------------------------------+"
    echo -e "| -> Updating the environment <- |"
    echo -e "+--------------------------------+"
    echo -e "${NC}"
    haxelib upgrade || false

    echo -e "${BGreen}"
    echo -e "+----------------------------------------+"
    echo -e "| -> Installation finished correctly! <- |"
    echo -e "+----------------------------------------+"
    echo -e "${NC}"
}

main "$@"
