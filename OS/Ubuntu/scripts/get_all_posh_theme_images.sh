#!/bin/bash

mkdir -p aux
rm -f aux/*
cd aux/



wget https://ohmyposh.dev/docs/themes -O index.html
grep -oP '"/assets/images/[^"]+\.png"' index.html > paths.txt
sed -i 's/"//g' paths.txt   # removing double quotes

# reading a file, line by line
while read -r path ; do wget "https://ohmyposh.dev/$path"  ; done < paths.txt 

# renaming the files appropriately
# `gruvbox-46aaec2d6ec227c6eb32a63d87c7b3a8.png` -> `gruvbox.png`
# `ls -tr` -> last created / modified files will be taken first
for file in $(ls -tr *-*.png) ; do mv "$file" "${file%-*}.png"; done

rm -f index.html paths.txt


############## DOWNLOAD complete #########################################
