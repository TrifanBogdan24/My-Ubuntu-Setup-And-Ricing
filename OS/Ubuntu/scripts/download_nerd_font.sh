#!/bin/bash

# nerd_font_downloader.sh

nr_args=$#

if [[ $nr_args -ne 1 ]]; then
	echo "Err: the script expects only a single argument: the URL of the font"
	echo "See fonts at: https://www.nerdfonts.com/font-downloads"
	exit 1
fi



URL=$1

wget $URL -O nerd-fonts.zip
unzip nerd-fonts.zip -d nerd-fonts
mkdir -p ~/.local/share/fonts
mv nerd-fonts/* ~/.local/share/fonts/
rm -rf nerd-fonts nerd-fonts.zip
fc-cache -fv
