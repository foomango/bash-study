#!/bin/bash
#################################################################
# Author:  WangFengwei (mn), foomango@gmail.com
#################################################################

#################################################################
# process_bar percent(def:0, max:100) total(def:100, max 200)
#################################################################
function process_bar {
    defpercent=0
    deftotal=100
    percent=${1:-$defpercent}
    total=${2:-$deftotal}


    # Max number of signs is 200
    hashes='########################################################################################################################################################################################################'
    spaces='                                                                                                                                                                                                        '

    hash_count=$(expr $percent \* $total)
    hash_count=$(expr $hash_count / 100)
    space_count=$(expr $total - $hash_count)

    hash_signs=$(expr substr "$hashes" 1 $hash_count)
    space_signs=$(expr substr "$spaces" 1 $space_count)

    # Overwrite current line
    echo -ne '\r'
    echo -n "[$hash_signs$space_signs]($percent%)"
}

function main {
    process_bar 1
    sleep 1
    process_bar 20
    sleep 1
    process_bar 100
    echo ""
}

main
