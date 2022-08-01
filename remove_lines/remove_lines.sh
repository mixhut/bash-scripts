#!/bin/sh
#
#                                                       _  _                            _     
#     _ __   ___  _ __ ___    ___  __   __  ___        | |(_) _ __    ___  ___     ___ | |__  
#    | '__| / _ \| '_ ` _ \  / _ \ \ \ / / / _ \       | || || '_ \  / _ \/ __|   / __|| '_ \ 
#    | |   |  __/| | | | | || (_) | \ V / |  __/       | || || | | ||  __/\__ \ _ \__ \| | | |
#    |_|    \___||_| |_| |_| \___/   \_/   \___| _____ |_||_||_| |_| \___||___/(_)|___/|_| |_|
#                                               |_____|                                       
# ---
# GitHub | @mixhut | v1.2 ============================================================================
# ---
# 
# Description:  Takes input from file which has keywords, including regex patterns to remove, applies it to file and saves changes.
# 
# Changes:      Created generate_terms.sh - generates a stopwords.txt file from premade sets in the /patterns folder.
#               Added case insensitive matching
#               Appended date to filenames processed for clarity
#
# To-Do:        Output pattern in memory, prepend to lines in the .deleted file to see which string is causing deletion (regex debugging).
# 
#
# Usage:        $ ./generate_terms.sh   # Generates a stopwords file
#               $ ./remove_lines.sh stopwords.txt your_target_file.txt


 
bold=$(tput bold)
normal=$(tput sgr0)

# CLI no input error message
if [ $# -eq 0 ]; then
    echo "\n  ${bold}USAGE${normal}: $ ./remove_lines.sh   ${bold}stopwords.txt   target_file.txt${normal} \
        \n\n  ${bold}stopwords.txt${normal} contains the changes you'd like to make. \n  Use simple regex within file for start and end of lines matching.\n  It should be formatted comma separated like so:\n\n\
    in rupees\n\
    canadian goose\n\
    in UK$\n\
    www\n\
    in vietnam\n\
    ^$\n"
    exit 1
fi

#gets length of stopwords.txt file
length=$(wc -l < $1)
# adds one to correct index 0,1 mismatch?
length=$(($length+1))

#set loop variables
filename=$1
targetfile=$2

#date variable for files
docdate=$(date +%F)

#backup original file
cp $targetfile $targetfile.$docdate.original.txt

# loops through every line in the stopwords.txt file, stores it as a variable.
# passes variables to sed to do inplace file replacement.
for i in $( seq 1 $length )
do 
	x=$(sed -n ""$i""p $filename)
#   sed -i -e "/${x}/d" $targetfile # case sensitive
    sed -i -e "/${x}/Id" $targetfile # case insensitive 
done



#change filename on completion
mv $targetfile $targetfile.$docdate.new.txt

#check changes between original and output
sdiff $targetfile.$docdate.original.txt $targetfile.$docdate.new.txt | grep '[<]' | awk -F\< '{print "" $1}' >> $targetfile.deleted

#tidy up sdiff output file
cut -f 1 $targetfile.deleted > $targetfile.$docdate.deleted.txt && rm $targetfile.deleted

#print completion message
echo "\n${bold}..........COMPLETED..........${normal}\n\n${bold}# LINES DELETED #${normal}\n     " && cat $targetfile.$docdate.deleted.txt
