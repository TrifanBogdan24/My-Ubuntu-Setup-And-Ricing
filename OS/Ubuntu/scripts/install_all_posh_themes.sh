#!/bin/bash

echo -e "Please see: https://ohmyposh.dev/docs/themes \n"


# # list of themes
promt_themes=(
    'agnoster.minimal'
    'agnoster'
    'agnosterplus'
    'aliens'
    'amro'
    'atomic'                        # one of my favourites
    'atomicBit'
    'avit'
    'blue-owl'                      # one of my favourites
    'blueish'                       # one of my favourites
    'bubbles'
    'bubblesextra'
    'bubblesline'
    'capr4n'
    'catppuccin'
    'catppuccin_latte'
    'catppuccin_macchiato'
    'catppuccin_mocha'
    'cert'
    'chips'
    'cinnamon'
    'clean-detailed'                # one of my favourites
    'cloud-context'
    'cloud-native-azure'
    'cobalt2'
    'craver'
    'darkblood'
    'devious-diamonds'
    'di4am0nd'
    'dracula'
    'easy-term'
    'emodipt-extend'
    'emodipt'
    'fish'
    'free-ukraine'
    'froczh'
    'glowsticks'
    'gmay'
    'grandpa-style'
    'gruvbox'
    'half-life'
    'honukai'
    'hotstick.minimal'
    'hul10'
    'hunk'
    'huvix'
    'if_tea'
    'illusi0n'
    'iterm2'
    'jandedobbeleer'
    'jblab_2021'
    'jonnychipz'
    'json'
    'jtracey93'
    'jv_sitecorian'
    'kali'                          # one of my favourites
    'kushal'
    'lambda'
    'lambdageneration'
    'larserikfinholt'
    'lightgreen'
    'marcduiker'
    'markbull'
    'material'
    'microverse-power'
    'mojada'
    'montys'
    'mt'
    'multiverse-neon'
    'negligible'
    'neko'
    'night-owl'
    'nordtron'
    'nu4a'
    'onehalf.minimal'
    'paradox'
    'pararussel'
    'patriksvensson'
    'peru'
    'pixelrobots'
    'plague'
    'poshmon'
    'powerlevel10k_classic'
    'powerlevel10k_lean'
    'powerlevel10k_modern'          # one of my favourites
    'powerlevel10k_rainbow'         # one of my favourites
    'powerline'
    'probua.minimal'
    'pure'
    'quick-term'                    # one of my favourites
    'remk'
    'robbyrussell'
    'rudolfs-dark'
    'rudolfs-light'
    'sim-web'
    'slim'
    'slimfat'
    'smoothie'
    'sonicboom_dark'
    'sonicboom_light'
    'sorin'
    'space'
    'spaceship'
    'star'
    'stelbent-compact.minimal'
    'stelbent.minimal'
    'takuya'
    'the-unnamed'
    'thecyberden'
    'tiwahu'
    'tokyo'
    'tokyonight_storm'
    'tonybaloney'
    'uew'
    'unicorn'
    'velvet'
    'wholespace'
    'wopian'
    'xtoys'
    'ys'
    'zash'
)


mkdir -p ~/.poshthemes

for theme in ${promt_themes[@]} ; do
    # notice the `$theme` in the paths
    wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/$theme.omp.json -O ~/.poshthemes/$theme.omp.json &> /dev/null

    exit_code=$?

    if [[ $exit_code != 0 ]] ; then
        echo "ERROR downoading theme $theme"
    fi

done


