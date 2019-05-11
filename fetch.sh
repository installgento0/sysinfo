#!/bin/bash
#May 11 2019
function println() {
        echo -e "\033[1m$1:\033[0m $2"
# \033[1m is the ascii bold escape character
# $1 prints out the first string passed to the function
# \033[0m sets it back to non-bold
# $2 prints out the data
}
println "Distro" "$(lsb_release -d | grep -o -P '(?<=:).*(?)' | tr -d '\t')"
println "Uptime" "$(uptime -p)"
println "Display" "$(xrandr | grep -w "primary" |grep -Eo '.*?[+0*#]')"
println "CPU" "$(sed -n  's/model name//p' /proc/cpuinfo | head -1 | tr -d '\t'| tr -d :)"
println "GPU" "$(lspci | grep ' VGA ' | grep -o -P '(?<=controller:).*(?)')"
println "Memory" "$(cat /proc/meminfo | grep -w "MemTotal" | grep -o -P '(?<= ).*(?)' | tr -s [:space:])"
println "DE" "$XDG_CURRENT_DESKTOP"

#May 10 2019
#OS="$(lsb_release -d)"
#Uptime="$(uptime -p)"
#Shell="$(echo $SHELL)"
#Monitor="$(xrandr | grep -w "primary" |grep -Eo '.*?[+0*#]')"
#CPU="$(sed -n  's/model name//p' /proc/cpuinfo | head -1)"
#GPU="$(lspci | grep ' VGA ' | grep -o -P '(?<=controller:).*(?)')"
#MEM="$(cat /proc/meminfo | grep -w "MemTotal" | grep -o -P '(?<= ).*(?)')"
#DE="$(echo $XDG_CURRENT_DESKTOP)"
#echo -e "$(tput sgr0)OS "$(tput bold)${OS}"\n$(tput sgr0)Uptime: "$(tput bold)${Uptime}"\n$(tput sgr0)Shell: "$(tput bold)${Shell}" \n$(tput sgr0)Monitor: "$(tput bold)${Monitor}" \n$(tput sgr0)CPU:"$(tput bold)${CPU}" \n$(tput sgr0)GPU:"$(tput bold)${GPU}" \n$(tput sgr0)Memory:"$(tput bold)${MEM}" \n$(tput sgr0)DE:"$(tput bold)${DE}""
