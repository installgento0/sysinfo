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
