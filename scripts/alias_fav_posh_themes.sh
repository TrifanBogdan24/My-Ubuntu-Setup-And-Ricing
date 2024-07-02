fav_posh_themes=(
    'atomic'                        # one of my favourites
    'blue-owl'                      # one of my favourites
    'blueish'                       # one of my favourites
    'clean-detailed'                # one of my favourites
    'kali'                          # one of my favourites
    'powerlevel10k_modern'          # one of my favourites
    'powerlevel10k_rainbow'         # one of my favourites
    'quick-term'                    # one of my favourites
)



for theme in "${fav_posh_themes[@]}" ; do
    alias "promt-theme-$theme"="eval \"\$(oh-my-posh init bash --config ~/.poshthemes/$theme.omp.json)\""
done
