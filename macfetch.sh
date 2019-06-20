#!/bin/bash
function println() {
echo -e "\033[1m$1:\033[0m $2"
# \033[1m is the ascii bold escape character
# $1 prints out the first string passed to the function
# \033[0m sets it back to non-bold
# $2 prints out the data
}
println "OSX build" "$(system_profiler SPSoftwareDataType | sed -n '/System Version/,/ /p' | grep -o 'System.*)')"
println "Uptime" "$(uptime | sed -E 's/^[^,]*up *//; s/, *[[:digit:]]* users.*//; s/min/minutes/; s/([[:digit:]]+):0?([[:digit:]]+)/\1 hours, \2 minutes/')"
println "Display" "$(system_profiler SPDisplaysDataType | grep "Resolution" | cut -d: -f2)"
println "CPU" "$(sysctl -n machdep.cpu.brand_string)"
println "GPU" "$(system_profiler SPDisplaysDataType | head -3 | tail -1 | cut -d: -f1 | tr -s [:space:])"
println "Memory" "$(system_profiler SPHardwareDataType | grep "  Memory:" | grep -o ':.*' | cut -d: -f2)"
println "DE" "$(echo "Aqua")"
