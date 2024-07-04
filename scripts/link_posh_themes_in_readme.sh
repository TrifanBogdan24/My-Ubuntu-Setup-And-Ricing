
#!/bin/bash

############## making a README*.md file to link the images ###############



echo -e "# All \`oh my posh\` prompt color themes\n" > README-posh-themes.md



# `ls -tr` -> last created / modified files will be taken first
for file in $(ls *.png | sort) ; do
    # removing the suffix from a variable: basename $FILE $SUFF
    # example: basename "atomic.png" ".png"  -> "atomic"
    theme_name=$(basename $file ".png")
    echo -e "- $theme_name: ![$theme_name]($file)\n" >> README-posh-themes.md
done
