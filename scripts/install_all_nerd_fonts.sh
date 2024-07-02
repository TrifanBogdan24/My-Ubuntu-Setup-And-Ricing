#!/bin/bash


curl https://www.nerdfonts.com/font-downloads &> /dev/null

exit_code=$?

if [[ $exit_code != 0 ]] ; then
    echo "ERROR at downloading the web page at: https://www.nerdfonts.com/font-downloads"
    exit 255
fi


curl https://www.nerdfonts.com/font-downloads | grep -o -E 'href\s*=\s*"https://github.com/[^/]+/nerd-fonts/releases/download/[^"]+\.zip"' > urls.txt


# deleting text around the actual URL
sed -i 's/href=//g' urls.txt
sed -i 's/"//g' urls.txt



mkdir -p ~/.local/share/fonts


# reading a file containing URLs
while read -r URL ; do
  

    echo "Downloading font at: $URL"

    wget $URL -O nerd-font.zip
    unzip nerd-font.zip -d new-font
    mv new-font/* ~/.local/share/fonts/
    rm -rf new-font nerd-font.zip

done < urls.txt


# MUST BE DONE AFTER DOWNLOADING
rm -rf new-font nerd-font.zip urls.txt
fc-cache -fv

# RESET THE TERMINAL AFTER: $ reset