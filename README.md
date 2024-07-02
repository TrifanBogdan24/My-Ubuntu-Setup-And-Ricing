# My `Ubuntu` `bash` Setup and Ricing


Here is my configuration for the `Linux UBUNTU` terminal.

🔁 Take it as a **backup** and easy way to transition from one PC or VM to another.



`Table of contents`

- [My `Ubuntu` `bash` Setup and Ricing](#my-ubuntu-bash-setup-and-ricing)
	- [What does `ricing` mean?](#what-does-ricing-mean)
	- [Installing commands](#installing-commands)
	- [Configuration File 💾 (`~/.bashrc`)](#configuration-file--bashrc)
	- [Terminal Customizations](#terminal-customizations)
		- [Nerd Fonts](#nerd-fonts)
		- [Setting Nerd Fonts](#setting-nerd-fonts)
		- [Configurable Terminal Prompt (`oh my posh`)](#configurable-terminal-prompt-oh-my-posh)
	- [Background Image of the terminal](#background-image-of-the-terminal)
		- [📥 Instalilling a `Terminal Emulator`](#-instalilling-a-terminal-emulator)
		- [🖼️ Setting the background image](#️-setting-the-background-image)
	- [Uninstalling Utilities](#uninstalling-utilities)


## What does `ricing` mean?
---
In the context of terminal configuration, `ricing` refers to the practice of 
customizing and beautifying the appearance and functionality of the terminal and other elements of the desktop environment.

The term originally comes from the custom car culture,
where `rice` was used to describe modifying cars with flashy but often unnecessary 
features.

In the tech world, ricing has been adopted to describe the process
of making a system look aesthetically pleasing and unique.




## Installing commands

> ❌ Do not execute the commands below as a script
>
> 🧑🏻‍💻 Some may expect user input.
>
> ⚠️ The installation might end with an error,
> so take them **individually** and analyze the reusult.






```sh
sudo apt update
sudo apt install snapd

sudo apt install google-chrome-stable

sudo apt install ripgrep
sudo apt install locate
sudo apt install fd-find
sudo apt install fzf        # fuzzy finder
sudo apt install sl         # Steam Locomotive
sudo apt install cmatrix



sudo apt install htop		# process viewer
sudo apt install bpytop		# resource monitor that shows usage and stats


# downloading instructions for multiple OS: https://snapcraft.io/zellij
# downloading instructions for Ubuntu: https://snapcraft.io/install/zellij/ubuntu
sudo snap install zellij --classic                  # a better TMUX

sudo apt install nano								# text editor
sudo snap install helix --classic                   # modal text editor

sudo snap install code --classic					# VS Code IDE
sudo snap install intellij-idea-ultimate --classic  # IDE for Java, Scala
sudo snap install rustrover --classic               # IDE for Rust
sudo snap install clion --classic                   # IDE for C/C++

sudo snap install onefetch  # info about GIT REPO
sudo apt-get install neofetch                       # info about OS distro

# downloading instructions: https://github.com/cowboy8625/rusty-rain.git
cargo install rusty-rain                            # a CMatrix clone in Rust



sudo apt install colortest


sudo snap install discord
sudo snapp install spotify



git config --user.name='TrifanBogdan24'
git config --user.email=''		# my email
```





## Configuration File 💾 (`~/.bashrc`)


In order for the following changes to be persistent over time (restarting the terminal)
the modifications are made in a configuration file, saved locally, on the disk.

> 💾 In my case, `~/.bashrc`.

In this file, the `PS1` environment variable and some suggestive **aliases** are set.


Each time a `bash` terminal is opened, all these instructions are executed,
and the **aliases** will be accessible in every such terminal session.



```sh
$ nano -l ~/.bashrc
```



Copy and paste the following code at the end of the configuration file:


```sh
# at the end of `~/.bashrc`:


# token for committing to my private repos
export GITHUB_TOKEN='my token'      # personal, sensitive info
alias github_token="echo $GITHUB_TOKEN"


alias chrome='google-chrome &> /dev/null &'
alias youtube='open https://www.youtube.com/ &> /dev/null'          # opens YouTube in web browser
alias chatgpt='open https://chatgpt.com/ &> /dev/null'				# opens ChatGpt in web browser

alias periodic-table='npx periodic-table-cli'
alias world-map='telnet mapscii.me'
alias recent-files='ls -ltrh'
alias cmd-help='compgen -c | fzf | xargs man'
alias ascii_colors='colortest-16b'
alias hacking-terminal='docker run --rm -it bcbcarl/hollywood'       # `CTRL-C` and `exit` to stop


                                            # escapes anotether alias
alias git_reset_last_commit="git reset --hard \$(git log | grep 'commit' awk 'NR==1 {print $2}')"

alias git_delete_last_commit="git reset --soft HEAD~1 && git push -f origin"


git_rename_last_commit() {
	# `$1` = arg 1 = new commit message
	git commit --ammend -m $1
	git push -f origin
}




# opens IDEs in current directory
alias vscode='code .'
alias open-rustrover='rustrover . &> /dev/null &'
alias open-intellij='intellij-idea-ultimate . &> /dev/null &'
alias open-clion='clion . &> /dev/null &'

alias ip='ip -c'		# colored command




# colored manual page
man() {
    LESS_TERMCAP_mb=$'\e[1;34m'   \
    LESS_TERMCAP_md=$'\e[1;32m'   \
    LESS_TERMCAP_so=$'\e[1;33m'   \
    LESS_TERMCAP_us=$'\e[1;4;31m' \
    LESS_TERMCAP_me=$'\e[0m'      \
    LESS_TERMCAP_se=$'\e[0m'      \
    LESS_TERMCAP_ue=$'\e[0m'      \
    command man "$@"
}



# for PS1 prompt variable
# get current branch in git repo
function parse_git_branch() {
    BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [ ! "${BRANCH}" == "" ]; then
        STAT=$(parse_git_dirty)
        if [ "${BRANCH}" == "master" ]; then
            echo -e "[\e[32mgit: master${STAT}\e[0m]"
        elif [ "${BRANCH}" == "main" ]; then
            echo -e "[\e[32mgit: main${STAT}\e[0m]"
        else
            echo "[git: ${BRANCH}${STAT}]"
        fi
    else
        echo ""
    fi
}



# for PS1 prompt variable
# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}






# daca nu iti place cum arata terminalul, comenteaza linia de mai jos
# PS1='\[\e[1;39m\](\[\e[0;0m\] \[\e[1;34m\]\u\[\e[0;0m\]\[\e[1;39m\]@\[\e[0m\]\[\e[1;34m\]\h\[\e[0m\]\[\e[1;39m\] )\[\e[0m\] \[\e[1;39m\]: [ \[\e[1;96m\]\w\[\e[0m\] \[\e[1;39m\]]\[\e[0m\] \[\e[1;39m\]$\[\e[0m\]\n\[\e[1;96m\]$\[\e[0m\] '


# without GIT REPO
# PS1='\[\e[1;39m\](\[\e[0;0m\] \[\e[1;34m\]\u\[\e[0;0m\]\[\e[1;39m\]@\[\e[0m\]\[\e[1;34m\]\h\[\e[0m\]\[\e[1;39m\] )\[\e[0m\] \[\e[1;39m\]: [ \[\e[1;96m\]\w\[\e[0m\] \[\e[1;39m\]]\[\e[0m\] \[\e[1;39m\]\[\e[0m\] \[\e[1;39m\]$\[\e[0m\] $(printf "%.0s." {1..10})\[\e[0m\] $(date "+%T") \n\[\e[1;96m\]$\[\e[0m\] '

# info about GIT REPO
PS1='\[\e[1;39m\](\[\e[0;0m\] \[\e[1;34m\]\u\[\e[0;0m\]\[\e[1;39m\]@\[\e[0m\]\[\e[1;34m\]\h\[\e[0m\]\[\e[1;39m\] )\[\e[0m\] \[\e[1;39m\]: [ \[\e[1;96m\]\w\[\e[0m\] \[\e[1;39m\]]\[\e[0m\] \[\e[1;39m\]$(parse_git_branch)\[\e[0m\] \[\e[1;39m\]$\[\e[0m\] $(printf "%.0s." {1..10})\[\e[0m\] $(date "+%T") \n\[\e[1;96m\]$\[\e[0m\] '



# displaying the logo of Arch Linux
# neofetch --ascii_distro arch


# the below command will display a logo of Ubuntu Linux
# neofetch --ascii_distro ubuntu --ascii_colors 4 7 --colors 6 7 7 6 7 7
```



```bash
$ source ~/.bashrc
$ reset
```



## Terminal Customizations

⚙️: Teminal -> Three Horizontal Bars -> Preferences -> Unnamed 
-> Colors -> Background -> `#0D0324`


⚙️: Terminal -> Three Horizontal Bars -> Preferences -> Unnnamed -> Text -> Cursor shape -> `I-Beam`


⚙️: Terminal -> Three Horizontal Bars -> Preferences -> Unnamed -> Cursor blinking -> `Enable`




### Nerd Fonts
---

> 🌐 Fonts: <https://www.nerdfonts.com/font-downloads>
> 
> 🌐 Also see: <https://www.nerdfonts.com/>


```bash
$ cd ~/Downloads/
$ mkdir nerd-fonts-helper-dir

$ touch nerd_font_downloader.sh
$ chmod +x nerd_font_downloader.sh
$ nano -l nerd_font_downloader.sh		# text editor
```


```bash
#!/bin/bash

# download_nerd_font.sh

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
```




```bash
$ # it might not work (be aware of the versions of the fonts)
$ ./nerd_font_downloader.sh https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/InconsolataGo.zip
```



> 📥 Script to install a single nerd font, being given an URL: [scripts/download_nerd_font.sh](scripts/download_nerd_font.sh)
>
> 📥 Script to install all single nerd fonts: [scripts/install_all_nerd_fonts.sh](scripts/install_all_nerd_fonts.sh)



### Setting Nerd Fonts
---


1. In `Ubuntu` terminal:
	⚙️: Terminal -> Three Horizontal Bars -> Preferences -> Text -> Check the box for `Custom font` and search for a **Nerd font**


2. In `VS Code` terminal:
	⚙️: Open `VS Code` -> `CTRL ,` -> Search for `terminal integrated font` -> type a **Nerd font** (some might not work well)





### Configurable Terminal Prompt (`oh my posh`)
---




🌐 `oh my posh` official website: <https://ohmyposh.dev/>


```bash
$ curl -s https://ohmyposh.dev/install.sh | sudo bash -s

$  mkdir -p ~/.poshthemes
```



🌐 `oh my posh` themes: <https://ohmyposh.dev/docs/themes>


> All these themes work only in [`Nerd Fonts`](https://www.nerdfonts.com/font-downloads)
>
> You have to set **terminal's font** for each `IDE` you use.
>
> Some fonts migth not work well in `IDE`s.





> 📥 Installing all `oh my posh` themes: [scripts/install_all_prompt_themes.sh](scripts/install_all_prompt_themes.sh)




**My favourite themes**:


> Setting `alias` for favourite color themes: [cripts/alias_fav_posh_themes.sh](scripts/alias_fav_posh_themes.sh)
>
> For persistance, place the code in `~/.bashrc` and use the following command: `source ~/.bashrc`




- [atomic](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/atomic.omp.json)

![atomic](https://ohmyposh.dev/assets/images/atomic-4a8859edab28466efd26209d93d3dcc9.png)

```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json -O ~/.poshthemes/atomic.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.poshthemes/atomic.omp.json)"
```

- [blue-owl](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/blue-owl.omp.json)

![blue-owl](https://ohmyposh.dev/assets/images/blue-owl-c1301b52c4ef00caee7fb59cc8e3e66e.png)

```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/blue-owl.omp.json -O ~/.poshthemes/blue-owl.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.poshthemes/blue-owl.omp.json)"
```


- [blueish](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/blueish.omp.json)

![blueish](https://ohmyposh.dev/assets/images/blueish-411e99ae6fe1ad3a08d8e829fe57f5ec.png)


```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/blueish.omp.json -O ~/.poshthemes/blueish.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.poshthemes/blueish.omp.json)"
```


- [clean-detailed](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/clean-detailed.omp.json)


![clean-detailed](https://ohmyposh.dev/assets/images/clean-detailed-b39a14070814882ee786b9d015632e83.png)


```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/clean-detailed.omp.json -O ~/.poshthemes/clean-detailed.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.poshthemes/clean-detailed.omp.json)"
```



- [kali](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/kali.omp.json)

![kali](https://ohmyposh.dev/assets/images/kali-d44eb156ab7a1ddc7c8574115be6686b.png)


```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/kali.omp.json -O ~/.poshthemes/kali.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.poshthemes/kali.omp.json)"
```


- [powerlevel10k_modern](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/powerlevel10k_modern.omp.json)

![powerlevel10k_modern](https://ohmyposh.dev/assets/images/powerlevel10k_modern-5acbb3cc704b3ba354038fd761624cbb.png)


```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/powerlevel10k_modern.omp.json -O ~/.poshthemes/powerlevel10k_modern.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.poshthemes/powerlevel10k_modern.omp.json)"
```



- [powerlevel10k_rainbow](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/powerlevel10k_rainbow.omp.json)
  
![powerlevel10k_rainbow](https://ohmyposh.dev/assets/images/powerlevel10k_rainbow-d0f7a57430232abfc03075450c8f7306.png)


```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/powerlevel10k_rainbow.omp.json -O ~/.poshthemes/powerlevel10k_rainbow.omp.json

eval "$(oh-my-posh init bash --config ~/.poshthemes/powerlevel10k_rainbow.omp.json)"
```


- [quick-term](https://ohmyposh.dev/assets/images/quick-term-2727301345826f64b6c74aef0e4e07cc.png)

![quick-term](https://ohmyposh.dev/assets/images/quick-term-2727301345826f64b6c74aef0e4e07cc.png)



```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/quick-term.omp.json -O ~/.poshthemes/quick-term.omp.json


# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.poshthemes/quick-term.omp.json)"
```





> I find `quick-term` to be the most suitable for me.
>
> So, the line `eval "$(oh-my-posh init bash --config ~/.poshthemes/quick-term.omp.json)"`
> will be inlcuded at the end of the configuration file `~/.bashrc`




## Background Image of the terminal
---



### 📥 Instalilling a `Terminal Emulator`
---

For this task, we will use a `Terminal Emulator`,
since the built-in console does not support background images.



Show applications (a square of 9 dots in right lower corner) ->
search for `Ubuntu Software` -> start typing `Xfce Terminal` -> 
install **Terminal Emulator**.


### 🖼️ Setting the background image
---

Open `Xfce Terminal` -> Bar -> `Edit` -> `Preferences...` -> Appearance -> Background -> select `Background image` and provide a path to the `File:` field.


> Also, in order for the promt to work, set a `Nerd Font`








## Uninstalling Utilities
---

Deleting a command is as simple as installing it,
the only difference in the one-liner is a word specified to the package manager.

> 🗑️ `remove` will take place of `install` argument.


```sh
sudo apt remove cmatrix
sudo snap remove code
sudo snap remove intellij-idea-ultimate
sudo snap remove rustrover
sudo snap remove clion

sudo apt remove nano
sudo snap remove helix

sudo snap remove zellij

sudo snap remove onefetch
sudo apt-get remove neofetch


sudo snap remove discord
sudo snap remove spotify
```
