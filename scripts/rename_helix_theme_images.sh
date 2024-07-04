#!/bin/bash


# I manage to capture all themes of `helix` text editor.
# The ScreenShots were taken (made, CREATED) in the exact same order their names appear


# Problem: in this directory, there are many many PNG images

# Along with a file `helix_theme_names.txt`
# which lines are sorted alphabetically.

# It is known that the last entry of the file is the actual name
# of the LATESET CREATED .png image.

# The script aims to rename the PNG files with the rows of `helix_theme_names.txt`

file='helix_theme_names.txt'


if [[ ! -f $file ]] ; then
	echo "ERR: missing input file `$file`"
	exit 255
fi


nr_pngs=$(cat $file | wc -l)

ls -t *.png | head -n $nr_pngs | tac > paths.txt

for ((i = 1 ; i <= $nr_pngs ; i++ )) ; do
	old_path="$(awk "NR==$i" paths.txt)"
	new_path="$(awk "NR==$i" $file).png"

	echo "$old_path -->  $new_path"

	if [[ $old_path != $new_path ]] ; then
		mv "$old_path" "$new_path"
	fi
done

rm -f paths.txt


# one-liner to copy the renamed files, from this directory to `helix` folder
for file in $(ls -t *.png | awk "NR <= $(cat helix_theme_names.txt | wc -l)") ; do cp $file ../images/themes/helix/ ; done
cp $file ../images/themes/helix/



