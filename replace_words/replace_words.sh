#!/bin/sh

#                     _                                                       _               _     
#  _ __   ___  _ __  | |  __ _   ___   ___        __      __  ___   _ __   __| | ___     ___ | |__  
# | '__| / _ \| '_ \ | | / _` | / __| / _ \       \ \ /\ / / / _ \ | '__| / _` |/ __|   / __|| '_ \ 
# | |   |  __/| |_) || || (_| || (__ |  __/        \ V  V / | (_) || |   | (_| |\__ \ _ \__ \| | | |
# |_|    \___|| .__/ |_| \__,_| \___| \___| _____   \_/\_/   \___/ |_|    \__,_||___/(_)|___/|_| |_|
#             |_|                          |_____|                  
# ---
# GitHub | @mixhut | v1.2 ============================================================================
# ---
#
# Changes:  - Added no cli args error message
#           - Removed unnecessary variables
#           - Added line dedupe 
#
# To-Do:    - Add line to loop that prints changes to file for manual error review.
# 
 
bold=$(tput bold)
normal=$(tput sgr0)

# CLI no input error message
if [ $# -eq 0 ]; then
    echo "\n	${bold}USAGE${normal}: $ ./replace_words.sh ${bold}changewords.txt targetfile.txt${normal} \
        \n\n	${bold}changewords.txt${normal} contains the changes you'd like to make.\n\
        It should be formatted comma separated like this:\n\n\
        chagnetihs,change this\n\
        2020,2022\n\
        2021,2022\n\
        emergancy,emergency\n"
    exit 1
fi

#gets length of changewords.txt file
length=$(wc -l < $1)
filename=$1
targetfile=$2

# loops through every line in the changewords.txt file, stores column 1 and 2 as variables.
# passes variables to gawk to do inplace file replacement.
for i in $( seq 1 $length )
do 
	x=$(sed -n ""$i""p $filename | awk 'BEGIN { FS = "," } ; //{print $1 }')
	y=$(sed -n ""$i""p $filename | awk 'BEGIN { FS = "," } ; //{print $2 }')
	gawk -i inplace "{gsub(\"$x\",\"$y\") }; { print }" $targetfile
done

awk '!seen[$0]++' $targetfile > $targetfile.RL.txt

echo "\n	${bold}FINISHED${normal}\n"

