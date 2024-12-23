# My `Ubuntu` `bash` Setup and Ricing


Here is my configuration for the `Linux UBUNTU` terminal.

🔁 Take it as a **backup** and easy way to transition from one PC or VM to another.



`Table of contents`

- [My `Ubuntu` `bash` Setup and Ricing](#my-ubuntu-bash-setup-and-ricing)
	- [Preview](#preview)
	- [🍚🥢 What does `ricing` mean?](#-what-does-ricing-mean)
	- [📥 Installing utilities](#-installing-utilities)
		- [`apt` packages installation](#apt-packages-installation)
		- [`snap` packages installation](#snap-packages-installation)
		- [`cargo` packages installation](#cargo-packages-installation)
		- [`npm` packages installation](#npm-packages-installation)
		- [`nala`](#nala)
	- [💾 Configuration File (`~/.bashrc`)](#-configuration-file-bashrc)
	- [⚙️ Basic Terminal Customizations](#️-basic-terminal-customizations)
		- [🗛 Nerd Fonts](#-nerd-fonts)
		- [🗛 My favourite Nerd Fonts](#-my-favourite-nerd-fonts)
		- [🗛 Setting Nerd Fonts](#-setting-nerd-fonts)
		- [Configurable Terminal Prompt (`oh my posh`)](#configurable-terminal-prompt-oh-my-posh)
	- [👨🏻‍💻 `Xfce` `Terminal Emulator`](#-xfce-terminal-emulator)
		- [📥 Instalilling a `Terminal Emulator` (`Xfce`)](#-instalilling-a-terminal-emulator-xfce)
		- [⚙️ Basic setup for `Xfce Terminal`](#️-basic-setup-for-xfce-terminal)
		- [🖼️ Setting the background image in `Xfce Terminal`](#️-setting-the-background-image-in-xfce-terminal)
	- [🖼️ Ubuntu Desktop `Tela Icon Theme`](#️-ubuntu-desktop-tela-icon-theme)
	- [🔁🖼️ Dynamic Background Images (from `GitHub` repos)](#️-dynamic-background-images-from-github-repos)
	- [`helix` (Modal Text Editor)](#helix-modal-text-editor)
	- [🗄️ `DNS` (Domain Name Server)](#️-dns-domain-name-server)
		- [🌐 What is `DNS`](#-what-is-dns)
		- [⚙️ Setting `DNS`](#️-setting-dns)
		- [❗⚠️ Troubleshooting `DNS` configuration](#️-troubleshooting-dns-configuration)
	- [✍️  Signing `Git` commits and tags with `GPG`](#️--signing-git-commits-and-tags-with-gpg)
		- [Generating a new `GPG` key](#generating-a-new-gpg-key)
		- [Enabling Signing `Git` Commits in `VS Code`](#enabling-signing-git-commits-in-vs-code)
		- [Adding a `GPG` key to `GitHub` account](#adding-a-gpg-key-to-github-account)
		- [✍️ Automatically signing all `git` commits and tags](#️-automatically-signing-all-git-commits-and-tags)
	- [Installing `Go`](#installing-go)
	- [`Charm CLI` | `Freeze`](#charm-cli--freeze)
	- [`Charm CLI` | `Glow`](#charm-cli--glow)
	- [`Charm CLI` | `Pop`](#charm-cli--pop)
	- [🗑️ Uninstalling Utilities](#️-uninstalling-utilities)



## Preview
---

![img](Images/cmds/neofetch_distros.png)

![img](Images/cmds/colored_man_page.png)

![img](Images/cmds/colored_ls.png)

![img](Images/cmds/colored_ip.png)

![img](Images/cmds/bat.png)

![img](Images/cmds/freeze_1.png)

![img](Images/cmds/birthday-1.png)
![img](Images/cmds/birthday-2.png)

![img](Images/cmds/npx%20periodic-table-cli.png)

![img](Images/cmds/spt-welcome-msg.png)
![img](Images/cmds/spt-song.png)
![img](Images/cmds/spt-album.png)
![img](Images/cmds/spt-analysis.png)

![img](Images/cmds/telnet%20mapscii.me.png)
![img](Images/cmds/tokei-code-statistics.png)




**Icons**
![img](Images/Icons/tela-blue-01.png)
![img](Images/Icons/tela-blue-02.png)


**IDEs and Text Editors Color Themes**:
![img](Images/Color-Themes/VS-Code/Blue_Black_(Blackest_With_Blue).png)
![img](Images/Color-Themes/VS-Code/Iceberg_Theme_by_cocopon.png)
![img](Images/Color-Themes/IDEA/Iceberg.png)
![img](Images/Color-Themes/helix/!my-fav-github_dark_colorblind.png)



## 🍚🥢 What does `ricing` mean?
---
In the context of terminal configuration, `ricing` refers to the practice of 
customizing and beautifying the appearance and functionality of the terminal and other elements of the desktop environment.

The term originally comes from the custom car culture,
where `rice` was used to describe modifying cars with flashy but often unnecessary 
features.

In the tech world, ricing has been adopted to describe the process
of making a system look aesthetically pleasing and unique.




## 📥 Installing utilities

> ❌ Do not execute the commands below as a script
>
> 🧑🏻‍💻 Some may expect user input.
>
> ⚠️ The installation might end with an error,
> so take them **individually** and analyze the reusult.



<!-- Package Managers -->

| Task                               | `apt`                                 | `apt-get`                            | `snap`                                 | `dpkg`                                   |
|------------------------------------|---------------------------------------|--------------------------------------|----------------------------------------|------------------------------------------|
| **Install Package Manager**        | Pre-installed                         | Pre-installed                        | `sudo apt install snapd`               | Pre-installed                           |
| **Update Package Manager**         | `sudo apt update`                     | `sudo apt-get update`                | `sudo snap refresh`                    | `sudo apt update`                        |
| **Update All Packages**            | `sudo apt upgrade`                    | `sudo apt-get upgrade`               | `sudo snap refresh`                    | `sudo apt upgrade`                       |
| **Install a Package**              | `sudo apt install <package>`          | `sudo apt-get install <package>`     | `sudo snap install <package>`          | `sudo dpkg -i <package>.deb`             |
| **List All Packages**              | `apt list --installed`                | `apt-get list --installed`           | `snap list`                            | `dpkg --list`                          .  |
| **Get Version of a Package**       | `apt show <package>`                  | `apt-cache policy <package>`         | `snap info <package>`                  | `dpkg -s <package>`                      |
| **Delete a Package**               | `sudo apt remove <package>`           | `sudo apt-get remove <package>`      | `sudo snap remove <package>`           | `sudo dpkg -r <package>`                 |

---

| Task                               | `cargo`                                  | `pip`/`pip3`                                 | `npm`                                  |
|------------------------------------|------------------------------------------|----------------------------------------------|---------------------------------------|
| **Install Package Manager**        | `sudo apt install cargo` or `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \| sh` | `sudo apt install python-pip` (for pip), `sudo apt install python3-pip` (for pip3) | `sudo apt install npm`                |
| **Update Package Manager**         | `cargo install-update -a`                | Not applicable (managed by Python installer) | `npm install -g npm@latest`          |
| **Update All Packages**            | `cargo install-update -a`                | `pip list --outdated` + `pip install --upgrade <package>`| `npm update -g`                     |
| **Install a Package**              | `cargo install <package>`                | `pip install <package>` (pip for Python 2), `pip3 install <package>` (pip for Python 3)| `npm install <package>`              |
| **List All Packages**              | `cargo install --list`                   | `pip list` or `pip3 list`                    | `npm list -g --depth=0`              |
| **Get Version of a Package**       | `cargo search <package>` or `cargo --version`| `pip show <package>` or `pip3 show <package>`| `npm list <package> -g`              |
| **Delete a Package**               | `cargo uninstall <package>`              | `pip uninstall <package>` or `pip3 uninstall <package>`| `npm uninstall -g <package>`         |




### `apt` packages installation


```sh
sudo apt update
sudo apt install snapd

sudo apt install cargo

sudo apt install nano
sudo apt install xfce4-terminal
sudo apt install google-chrome-stable

# installing `rg` command
sudo apt install ripgrep					# has `cargo` alternative

sudo apt install locate
sudo apt install fd-find

sudo apt install fzf						# has `cargo` alternative

sudo apt install htop
sudo apt install bpytop
sudo apt install exa						# has `cargo` alternative
sudo apt install neofetch					# has `snapd` alternative
sudo apt install fd-find

sudo apt install colortest
sudo apt install cmatrix
sudo apt install sl         				# Steam Locomotive animation

# For copy-ing the output of a (piped) command to clipboard
sudo apt-get install xclip
```






### `snap` packages installation
---


**Installing `snap` utility**:
```bash
sudo apt update
sudo apt install snapd
sudo snap refresh							# updating all `snap` packages
```



**`snap` packages**:
```bash
sudo snap install code --classic					# VS Code IDE
sudo snap install intellij-idea-ultimate --classic  # IDE for Java, Scala
sudo snap install rustrover --classic               # IDE for Rust
sudo snap install clion --classic                   # IDE for C/C++

sudo snap install onefetch					# has `apt` alternative
sudo snap install bottom

sudo snap install helix --classic
sudo snap install zellij --classic			# has `cargo` alternative
sudo snap install spt						# has `cargo` alternative (spotify-tui)

sudo snap install discord
sudo snapp install spotify

sudo snap install docker
```



**Updating all `snap` packages**:
```bash
sudo snap refresh
```



**Listing all `snap` packages**:
```bash
snap list
```




### `cargo` packages installation
---


**Installing `cargo` utility**:
```bash
# installing `cargo`
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env						# place it in ~/.bashrc
```
or
```bash
sudo apt install cargo
```


**`cargo` packages**:
```bash
# installing `spt` command
cargo install spotify-tui					# has `sanp` alternative (spt)

cargo install hurl							# has `snap` alternative
cargo install rusty-rain
cargo install lsd
cargo install exa							# has `apt` alternative
cargo install bat
cargo install tokei


# installing `rg` command
cargo install ripgrep						# has `apt` alternative
```



**Listing all `carg` packages**:
```bash
cargo install --list
```



### `npm` packages installation
---


```bash
sudo npm install -g birthday
# option (manual): birthday --help
# adding new birthday: birthday -n coco gauff -d 13/03/2004
# displaying the table of birthdays: birthday
```




### `nala`
---



<!-- Stop using APT -->
<div style="border: 1px solid #ddd; padding: 10px; max-width: 300px; position: relative; display: inline-block;">
	<a href="https://youtu.be/oroSkR4Nn_w" target="_blank" style="display: block; position: relative;">
		<!--  Thumbnail -->
		<img src="https://i.ytimg.com/vi/oroSkR4Nn_w/sddefault.jpg" alt="YouTube Thumbnail" style="width: 100%; display: block;">
		<!-- Play button in the center -->
		<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 60px; height: 60px; background: rgba(255, 0, 0, 0.8); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
			<div style="width: 0; height: 0; border-left: 15px solid white; border-top: 10px solid transparent; border-bottom: 10px solid transparent;"></div>
		</div>
		<!-- Black rectangle with duration at bottom-right -->
		<div style="position: absolute; bottom: 8px; right: 8px; background: rgba(0, 0, 0, 0.8); color: white; padding: 2px 6px; font-size: 12px; border-radius: 3px;">
			09:56
		</div>
	</a>
	<div style="margin: 0 auto; width: 90%; text-align: left;">
		<!-- Text of URL -->
		<p style="margin: 10px 0;"><a href="https://youtu.be/oroSkR4Nn_w" target="_blank">https://youtu.be/oroSkR4Nn_w</a></p>
		<!-- Separation line -->
		<hr style="border: 0; height: 1px; background: #ddd; margin: 10px 0;">
		<!-- Text of Title -->
		<p style="margin: 10px 0;"><a href="https://youtu.be/oroSkR4Nn_w" target="_blank">Stop using APT</a></p>
	</div>
</div>



> Check the GitLab repo: <https://gitlab.com/volian/nala.git>.



Installation: <https://gitlab.com/volian/nala/-/wikis/Installation>.


```bash
$ sudo apt install nala

# Alternatively you can use the Volian Scar repo
$ curl https://gitlab.com/volian/volian-archive/-/raw/main/install-nala.sh | bash

# Note: Ubuntu 20.04, 22.04 and Debian Bullseye this script may fail. If it does run:
$ sudo apt install -t nala nala
```


Commands for nala:
```bash
$ sudo nala upgrade
$ nala history
$ nala install kitty
$ nala history
$ sudo nala history undo 2

# Fetch fast mirrors to improve download speed
$ sudo nala fetch

$ sudo nala update
```



## 💾 Configuration File (`~/.bashrc`)
---

In order for the following changes to be persistent over time (restarting the terminal)
the modifications are made in a configuration file, saved locally, on the disk.

> 💾 In my case, `~/.bashrc`.


Each time a `bash` terminal is opened, all these instructions are executed,
and the **aliases** will be accessible in every such terminal session.



Despise the `~/.bashrc`, I have grouped the code in **multiple** `configuration files`:
1. [`~/.variables.sh`](.dotfiles/.variables.sh)
2. [`~/.aliases.sh`](.dotfiles/.aliases.sh)
3. [`~/.functions.sh`](.dotfiles/.functions.sh)



In these filee, the `PS1` environment variable and some suggestive **aliases** are set.




```bash
touch ~/.variables.sh
touch ~/.aliases.sh
touch ~/.functions.sh
```



```bash
$ nano -l functions.sh
```
```bash
# ~/.functions.sh

# colored manual page
function man() {
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




function git_rename_last_commit() {
	nr_args=$#

	if [[ $# -ne 1 ]] ; then
		echo "ERR: expects a single argument, the updated message for last commit"
		# `return` instead of `exit` to avoid exiting the shell session when sourced in a script or terminal
		return 1
	fi

	msg=$1
	git commit --ammend -m $msg
	git push -f origin
}



function find_replace_in_file() {
	nr_args=$#
	
	if [[ $nr_args -ne 3 ]] ; then
		echo "ERR: Invalid number of arguments"
		echo "Expect the OLDTEXT, the NEWTEXT and the path to the file"
		return 1
	fi

	old=$1
	new=$2
	file=$3
	sed -i 's/$old/$new/g' $file
}




function find_replace_text_to_stdout() {
    nr_args=$#

    if [[ $nr_args -lt 2 || $nr_args -gt 3 ]] ; then
        echo "ERR: Invalid number of arguments"
        echo "Expect the OLDTEXT, the NEWTEXT, and optionally the path to the file"
        return 1
    fi

    old=$1
    new=$2

    if [[ $nr_args -eq 3 ]] ; then
        file=$3
        sed "s/$old/$new/g" "$file"
    else
        # works withe pipes, example: `cat in.txt | sed old new`
        sed "s/$old/$new/g"
    fi
}



function diacritics_replaced_with_ENG_letters() {
	nr_args=$#
	func_name=${FUNCNAME[0]}

	if [[ $nr_args != 1 ]] ; then
		echo "ERR: The script expects a file as argument." >&2
		echo "Example: $ $func_name file" >&2
		return 1   # DON'T use 'exit'
	fi


	file=$1

	if [[ ! -f $file ]] ; then
		echo "ERR: The argument <$file> is not a file." >&2
		return 1   # DON'T use 'exit'
	fi


	sed -i -E 's/[ĂÂ]/A/g' $file   # ['Ă', 'Â'] -> 'A'
	sed -i -E 's/[ăâ]/a/g' $file   # ['ă', 'â'] -> 'a'

	sed -i 's/Î/I/g' $file	 # 'Î' -> I
	sed -i 's/î/i/g' $file   # 'î' -> i

	sed -i 's/Ș/S/g' $file   # 'Ș' -> S
	sed -i 's/ș/s/g' $file   # 'ș' -> 's'

	sed -i 's/Ț/T/g' $file   # 'Ț' -> 'T'
	sed -i 's/ț/t/g' $file   # 'ț' -> 't'
}

```




```bash
$ nano -l ~/.variables.sh
```
```bash
# ~/.variables.sh

export GITHUB_TOKEN='my token'      # personal, sensitive info


# daca nu iti place cum arata terminalul, comenteaza linia de mai jos
# export PS1='\[\e[1;39m\](\[\e[0;0m\] \[\e[1;34m\]\u\[\e[0;0m\]\[\e[1;39m\]@\[\e[0m\]\[\e[1;34m\]\h\[\e[0m\]\[\e[1;39m\] )\[\e[0m\] \[\e[1;39m\]: [ \[\e[1;96m\]\w\[\e[0m\] \[\e[1;39m\]]\[\e[0m\] \[\e[1;39m\]$\[\e[0m\]\n\[\e[1;96m\]$\[\e[0m\] '


# without GIT REPO
# export PS1='\[\e[1;39m\](\[\e[0;0m\] \[\e[1;34m\]\u\[\e[0;0m\]\[\e[1;39m\]@\[\e[0m\]\[\e[1;34m\]\h\[\e[0m\]\[\e[1;39m\] )\[\e[0m\] \[\e[1;39m\]: [ \[\e[1;96m\]\w\[\e[0m\] \[\e[1;39m\]]\[\e[0m\] \[\e[1;39m\]\[\e[0m\] \[\e[1;39m\]$\[\e[0m\] $(printf "%.0s." {1..10})\[\e[0m\] $(date "+%T") \n\[\e[1;96m\]$\[\e[0m\] '

# info about GIT REPO
export PS1='\[\e[1;39m\](\[\e[0;0m\] \[\e[1;34m\]\u\[\e[0;0m\]\[\e[1;39m\]@\[\e[0m\]\[\e[1;34m\]\h\[\e[0m\]\[\e[1;39m\] )\[\e[0m\] \[\e[1;39m\]: [ \[\e[1;96m\]\w\[\e[0m\] \[\e[1;39m\]]\[\e[0m\] \[\e[1;39m\]$(parse_git_branch)\[\e[0m\] \[\e[1;39m\]$\[\e[0m\] $(printf "%.0s." {1..10})\[\e[0m\] $(date "+%T") \n\[\e[1;96m\]$\[\e[0m\] '
```





```bash
$ nano -l aliases.sh
```
```bash
# ~/.aliases

alias github_token="echo $GITHUB_TOKEN"
alias nano='nano --linenumbers --mouse --tabsize=4'

alias chrome='google-chrome &> /dev/null &'
alias youtube='google-chrome https://www.youtube.com/ &> /dev/null &'       	# opens YouTube in web browser (`google-chrome` can be replaced with `open`)
alias chatgpt='google-chrome https://chatgpt.com/ &> /dev/null &'				# opens ChatGpt in web browser (`google-chrome` can be replaced with `open`)

alias periodic-table='npx periodic-table-cli'
alias world-map='telnet mapscii.me'
alias ls-one-line='ls -1'
alias ls-recent-files='ls -altrh'
alias cmd-help='compgen -c | fzf | xargs man'
alias ascii_colors='colortest-16b'
alias hacking-terminal='docker run --rm -it bcbcarl/hollywood'       # `CTRL-C` and `exit` to stop
alias hollywood='docker run --rm -it bcbcarl/hollywood'       # `CTRL-C` and `exit` to stop
alias sl='sl -e'	# enables `CTRL C` (SIGINT signal)

alias git_cheat_sheet='google-chrome https://ndpsoftware.com/git-cheatsheet.html#loc=index &> /dev/null &'	# open Git Cheat Sheet in web browser (`google-chrome` can be replaced with `open`)

alias git_reset_last_commit="git reset --hard \$(git log | grep 'commit' awk 'NR==1 {print $2}')"

alias git_delete_last_commit="git reset --soft HEAD~1 && git push -f origin"

alias open_git_repository_in_github="open \$(git config --list | grep 'http' | sed 's/remote.origin.url=//g') &> /dev/null &"


# opens IDEs in current directory
alias vscode='code .'
alias open-rustrover='rustrover . &> /dev/null &'
alias open-intellij='intellij-idea-ultimate . &> /dev/null &'
alias open-clion='clion . &> /dev/null &'

alias lsc=exa			# colored ls cmd
alias ip='ip -c'		# colored ip cmd



alias fzf_print_file='file=$(fzf) && echo "Absolute path: $(realpath $file)" && cat "$file"'


alias fzf_cmd_helper='cmd=$(compgen -c | fzf) && man $cmd 2> /dev/null || $cmd --help 2> /dev/null || type $cmd 2> /dev/null || echo "unkwon $cmd"'


alias fzf_history='cmd=$(history | sort -r | fzf | awk '\''{$1=""; print substr($0,2)}'\'') && echo "$cmd" && eval "$cmd"'


# For copy-ing the output of a (piped) command to clipboard
alias copy='xclip -selection clipboard'


# List of favourite `oh-my-posh` themes
# Make sure to install them, before making aliases
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
    alias "prompt-theme-$theme"="eval \"\$(oh-my-posh init bash --config ~/.posh-themes/$theme.omp.json)\""
done
```




Copy and paste the following code at the end of the configuration file:

```bash
nano ~/.bashrc
```
```bash
# at the end of `~/.bashrc`:






# the order matters
source ~/.functions.sh
source ~/.variables.sh
source ~/.aliases.sh



# my favourite `oh-my-posh` theme
eval "$(oh-my-posh init bash --config ~/.posh-themes/blue-owl.omp.json)"




# displaying the logo of Arch Linux
# neofetch --ascii_distro arch


# the below command will display a logo of Ubuntu Linux
# neofetch --ascii_distro ubuntu --ascii_colors 4 7 --colors 6 7 7 6 7 7


# Kali Linux
# neofetch --ascii_distro kali --colors 6 7 7 6 7



neofetch --ascii_distro ubuntu --ascii_colors 4 7 --colors 6 7 7 6 7 7
```



```bash
$ source ~/.bashrc
$ reset
```



## ⚙️ Basic Terminal Customizations
---

⚙️: Teminal -> Three Horizontal Bars -> Preferences -> Unnamed 
-> Colors -> Background -> `#0D0324`


![img](Images/Settings/terminal_background.png)


⚙️: Terminal -> Three Horizontal Bars -> Preferences -> Unnamed -> Text -> Cursor shape -> `I-Beam`

![img](Images/Settings/terminal_cursor_shape_I_beam.png)


⚙️: Terminal -> Three Horizontal Bars -> Preferences -> Unnamed -> Text -> Cursor blinking -> `Enabled`

![img](Images/Settings/terminal_cursor_blincking_enabled.png)



### 🗛 Nerd Fonts
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



### 🗛 My favourite Nerd Fonts
---
- `0xProto Nerd Font`
- `3270 Nerd Font`
- `CommitMono Nerd Font`
- `JetBrainsMono Nerd Font`
- `M+ Nerd Font`
- `RobotoMono Nerd Font`
- `Ubuntu Nerd Font`
- `UbuntuMono Nerd Font`
- `UbuntuSans Nerd Font`
- `VictorMono Nerd Font`




### 🗛 Setting Nerd Fonts
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

$ mkdir -p ~/.posh-themes
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




- [atomic](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/color-themes/atomic.omp.json)

![atomic](Images/Color-Themes/oh_my_posh/atomic.png)

```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/color-themes/atomic.omp.json -O ~/.posh-themes/atomic.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.posh-themes/atomic.omp.json)"
```

- [blue-owl](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/color-themes/blue-owl.omp.json)

![blue-owl](Images/Color-Themes/oh_my_posh/blue-owl.png)

```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/color-themes/blue-owl.omp.json -O ~/.posh-themes/blue-owl.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.posh-themes/blue-owl.omp.json)"
```


- [blueish](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/color-themes/blueish.omp.json)

![blueish](Images/Color-Themes/oh_my_posh/blueish.png)


```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/color-themes/blueish.omp.json -O ~/.posh-themes/blueish.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.posh-themes/blueish.omp.json)"
```


- [clean-detailed](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/color-themes/clean-detailed.omp.json)


![clean-detailed](Images/Color-Themes/oh_my_posh/clean-detailed.png)


```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/color-themes/clean-detailed.omp.json -O ~/.posh-themes/clean-detailed.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.posh-themes/clean-detailed.omp.json)"
```



- [kali](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/color-themes/kali.omp.json)

![kali](Images/Color-Themes/oh_my_posh/kali.png)


```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/color-themes/kali.omp.json -O ~/.posh-themes/kali.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.posh-themes/kali.omp.json)"
```


- [powerlevel10k_modern](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/color-themes/powerlevel10k_modern.omp.json)

![powerlevel10k_modern](Images/Color-Themes/oh_my_posh/powerlevel10k_modern.png)


```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/color-themes/powerlevel10k_modern.omp.json -O ~/.posh-themes/powerlevel10k_modern.omp.json

# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.posh-themes/powerlevel10k_modern.omp.json)"
```



- [powerlevel10k_rainbow](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/color-themes/powerlevel10k_rainbow.omp.json)
  
![powerlevel10k_rainbow](Images/Color-Themes/oh_my_posh/powerlevel10k_rainbow.png)


```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/color-themes/powerlevel10k_rainbow.omp.json -O ~/.posh-themes/powerlevel10k_rainbow.omp.json

eval "$(oh-my-posh init bash --config ~/.posh-themes/powerlevel10k_rainbow.omp.json)"
```


- [quick-term](https://ohmyposh.dev/assets/images/quick-term-2727301345826f64b6c74aef0e4e07cc.png)

![quick-term](Images/Color-Themes/oh_my_posh/quick-term.png)



```bash
# Installing the theme
wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/color-themes/quick-term.omp.json -O ~/.posh-themes/quick-term.omp.json


# Setting the prompt
eval "$(oh-my-posh init bash --config ~/.posh-themes/quick-term.omp.json)"
```





> I find `quick-term` to be the most suitable for me.
>
> So, the line `eval "$(oh-my-posh init bash --config ~/.posh-themes/quick-term.omp.json)"`
> will be inlcuded at the end of the configuration file `~/.bashrc`




## 👨🏻‍💻 `Xfce` `Terminal Emulator`
---



### 📥 Instalilling a `Terminal Emulator` (`Xfce`)
---

For this task, we will use a `Terminal Emulator`,
since the built-in console does not support background images.



Show applications (a square of 9 dots in right lower corner) ->
search for `Ubuntu Software` -> start typing `Xfce Terminal` -> 
install **Terminal Emulator**.


> Alternative `shell` command:
```bash
# Terminal Emulator that enables setting a background image
sudo apt install xfce4-terminal
```


`Xfce` command for creating a new **window**/**tab**:
- New **window**: `xfce4-terminal`
- New **tab**: `xfce4-terminal --tab` (in an existing **window**, otherwise it creates a **window** with two **tabs**)


```sh
xfce4-terminal &		# new window
xfce4-terminal --tab &	# new tab inside of window
```



**Result**:
![img](Images/cmds/xfce4-terminal-with-background-image.png)


### ⚙️ Basic setup for `Xfce Terminal`
---


⚙️ `Xfce Terminal` -> `Edit` -> `Preferences...` -> Cursor shape -> `I-Beam`

⚙️ `Xfce Terminal` -> `Edit` -> `Preferences...` -> Cursor shape -> check 🗹 `Cursor blinks` box


⚙️ `Xfce Terminal` -> `Edit` -> `Preferences...` -> Cursor shape -> check 🗹 `Automatically copy selection to clipboard` box

⚙️ `Xfce Terminal` -> `Edit` -> `Preferences...` -> Cursor shape -> check ☐ `Show unsafe paste dialog` box





### 🖼️ Setting the background image in `Xfce Terminal`
---

Open `Xfce Terminal` -> Bar -> `Edit` -> `Preferences...` -> Appearance -> Background -> select `Background image` and provide a path to the `File:` field.


> Also, in order for the prompt to work, set a `Nerd Font`




## 🖼️ Ubuntu Desktop `Tela Icon Theme`
---


Please see this GitHub repo: <https://github.com/vinceliuice/Tela-icon-theme.git>


Installing using the command line:

```bash
$ sudo snap install tela-icons
```

Installing using the Ubuntu GUI:
⚙️ Ubuntu Software -> search for and install `Tela Icon Theme`.



Using `Tela Icon Theme` requires having `GNOME Tweaks`:
```bash
$ sudo apt install gnome-tweaks
```


Setting up the `Tela Icon Theme` (using Ubuntu GUI):
⚙️ Show Applications -> Tweaks -> Appearance -> Icons -> Select an Icon Theme.


![img](Images/Settings/tela_icons.png)


My favourite `Tela Icon Themes` are:
- `Tela-blue`/`Tela-blue-dark`
- `Tela-nord`/`Tela-nord-dark`


Results:
![img](Images/Icons/tela-blue-01.png)
![img](Images/Icons/tela-nord-02.png)



## 🔁🖼️ Dynamic Background Images (from `GitHub` repos)
---

See these `GitHub` repositories:
- <https://github.com/manishprivet/dynamic-gnome-wallpapers>
- <https://github.com/saint-13/Linux_Dynamic_Wallpapers>



**For <https://github.com/manishprivet/dynamic-gnome-wallpapers>**:


Wallpaper Gallery (a handful of themes):
- Lakeside
- A Certain Magical Index
- Exodus
- Minimal-Mojave
- Mojave
- Mojave V2
- Big_Sur_Beach
- Firewatch
- Lakeside-2
- Big_Sur
- Fuji
- Catalina

Installation:
```bash
$ curl -s https://wallpapers.manishk.dev/install.sh | bash -s $THEME_CODE
```


Global Installation (for all users on the system):
```bash
curl -s https://wallpapers.manishk.dev/install.sh | sudo bash -s $THEME_CODE --global
```


**For  <https://github.com/saint-13/Linux_Dynamic_Wallpapers>**:
```bash
$ cd ~
$ git clone https://github.com/saint-13/Linux_Dynamic_Wallpapers.git
$ cd Linux_Dynamic_Wallpapers
$ sudo bash ./install.sh
```

Is rich in themes.




## `helix` (Modal Text Editor)


**Installation**:
```bash
sudo apt update
sudo apt install snapd
sudo snap refresh
sudo snap install helix --classic
```


> See all `helix themes` in [this PDF](Images/Color-Themes/helix/README-helix-themes.pdf).


**My favourite `dark` color themes**:
- [amberwood](Images/Color-Themes/helix/amberwood.png)
- [ayu_dark](Images/Color-Themes/helix/ayu_dark.png)
- [ayu_evolve](Images/Color-Themes/helix/ayu_evolve.png)
- [curzon](Images/Color-Themes/helix/curzon.png)
- [github_dark_colorblind](Images/Color-Themes/helix/github_dark_colorblind.png)
- [github_dark_high_contrast](Images/Color-Themes/helix/github_dark_high_contrast.png)
- [github_dark](Images/Color-Themes/helix/github_dark.png)
- [jetbrains_dark](Images/Color-Themes/helix/jetbrains_dark.png)
- [material_deep_ocean](Images/Color-Themes/helix/material_deep_ocean.png)


**My favourite `light` color themes**:
- [serika-light](Images/Color-Themes/helix/serika-light.png)
- [tokyonight_day](Images/Color-Themes/helix/tokyonight_day.png)
- [zed_onelight](Images/Color-Themes/helix/zed_onelight.png)




## 🗄️ `DNS` (Domain Name Server)
---



### 🌐 What is `DNS`
---

> `DNS` is an Internet protocol that maps `URL`s (Uniform Resource Locators) or domain names to `IP` addresses.
> This process in essential because while humans find it
> easier to remember and use domain names, like [www.example.com](https://www.example.com/),
> computers and network devices use `IP` addresses (like `192.0.2.1` to identify each other on the internet).



Useful links:
- Known `DNS` providers: <https://adguard-dns.io/kb/general/dns-providers/>

- `DNS` filtering: <https://adguard-dns.io/kb/general/dns-filtering/>



> I use the following `DNS` `IP`s: `94.140.14.15` and `94.140.15.16`



### ⚙️ Setting `DNS`
---


> Using the `GUI` of `Ubuntu`: <https://phoenixnap.com/kb/ubuntu-dns-nameservers>



I don't recommend the above link, but it's just in case.

Let's be professional and use the terminal 👨🏻‍💻.



```bash
$ cat /etc/resolv.conf
# This is /run/systemd/resolve/stub-resolv.conf managed by man:systemd-resolved(8).
# Do not edit.
#
# This file might be symlinked as /etc/resolv.conf. If you're looking at
# /etc/resolv.conf and seeing this text, you have followed the symlink.
#
# This is a dynamic resolv.conf file for connecting local clients to the
# internal DNS stub resolver of systemd-resolved. This file lists all
# configured search domains.
#
# Run "resolvectl status" to see details about the uplink DNS servers
# currently in use.
#
# Third party programs should typically not access this file directly, but only
# through the symlink at /etc/resolv.conf. To manage man:resolv.conf(5) in a
# different way, replace this symlink by a static file or a different symlink.
#
# See man:systemd-resolved.service(8) for details about the supported modes of
# operation for /etc/resolv.conf.

nameserver 127.0.0.53
options edns0 trust-ad
search .

```



> 👉 Notice that `/etc/resolv.conf` is a **symbolic link**
> to another configuration file, **in this case**, `/run/systemd/resolve/stub-resolv.conf`
> 
> 📢 Also notice the comment `# Do not edit`




Since `/etc/resolv.conf` is managed by `systemd-resolved`
and is **symlinked** to `/run/systemd/resolve/stub-resolv.conf`,
the `DNS` configuration must be updated using the `systemd-resolved` **configuration file**.


```bash
$ sudo nano -l /etc/systemd/resolved.conf
```


**Uncomment** and **set** the `DNS` and `FallbackDNS` lines
with desired DNS servers. For example:

```
[Resolve]
DNS=94.140.14.15 94.140.15.16
FallbackDNS=8.8.8.8 8.8.4.4 1.1.1.1 1.0.0.1
```



```bash
$ sudo systemctl restart systemd-resolved
$ resolvectl status
Global
           Protocols: -LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
    resolv.conf mode: stub
         DNS Servers: 94.140.14.15 94.140.15.16
Fallback DNS Servers: 8.8.8.8 8.8.4.4 1.1.1.1 1.0.0.1
```




> An alternative to `resolvectl status` could be `resolvectl dns`:
```bash
$ resolvectl dns
Global: 94.140.14.15 94.140.15.16
Link 2 (enp1s0): 94.140.14.15 94.140.15.16
Link 3 (wlp2s0): 8.8.8.8 1.1.1.1
Link 4 (docker0):
```



> The `FallbackDNS` entries are optional and will be used if the primary DNS servers are unreachable.




### ❗⚠️ Troubleshooting `DNS` configuration

> If there are errors at setting **global** `DNS`
> configure the **interfaces**, otherwise skip this part.


If it appears that the `DNS` setting for specific network interfaces
(`enp1s0` and `wlp2s0`) might not be using the global `DNS`
server, here is the solution:


1. Step 1: Clear Link-Specific `DNS` Settings
```bash
$ sudo resolvectl dns enp1s0 94.140.14.15 94.140.15.16
$ sudo resolvectl dns wlp2s0 94.140.14.15 94.140.15.16
```
2. Step 2: Verify the `DNS` Configuration
```bash
$ resolvectl status
```


3. Step 3: Update Network Manager Configuration (if applicable)

If you're using NetworkManager,
it might override systemd-resolved settings.
You can update the DNS configuration in NetworkManager.

```bash
$ sudo nano /etc/NetworkManager/NetworkManager.conf
```

Add the following lines (if not already present):
```
[main]
dns=systemd-resolved
```


Restart NetworkManager:
```bash
$ sudo systemctl restart NetworkManager
```


4. Step 4: Ensure /etc/resolv.conf is Symlinked Correctly
```bash
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
```





5. Step 5: Recheck the Status
```bash
$ resolvectl status
```



## ✍️  Signing `Git` commits and tags with `GPG`
---



<!-- "Git" verified -->
<div style="border: 1px solid #ddd; padding: 10px; max-width: 300px; position: relative; display: inline-block;">
  <a href="https://www.youtube.com/shorts/oIGzfvBb6Hk?feature=share" target="_blank" style="display: block; position: relative;">
    <img src="https://img.youtube.com/vi/oIGzfvBb6Hk/hqdefault.jpg" alt="YouTube Shorts Thumbnail" style="width: 100%; display: block;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 60px; height: 60px; background: rgba(255, 0, 0, 0.8); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
      <svg viewBox="0 0 24 24" fill="white" style="width: 24px; height: 24px;"><path d="M8 5v14l11-7L8 5z"/></svg>
    </div>
  </a>
  <p><a href="https://www.youtube.com/shorts/oIGzfvBb6Hk?feature=share" target="_blank">"Git" verified https://www.youtube.com/shorts/oIGzfvBb6Hk?feature=share</a></p>
</div>




> Useful links:
> - [GitHub Docs Generating a new GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
> - [GitHub Docs Adding a GPG key to your GitHub account](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account)
> - [GitHub Docs Telling Git about your signing key](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key)`
> - [GitHub Docs Associating an email with your GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification/associating-an-email-with-your-gpg-key)
> - [GitHub Docs Signing commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)
> - [GitHub Docs Signing tags](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-tags)





Before and After signing `git` commits with `gpg`:
![img](Images/Settings/verified-git-commit.png)


### Generating a new `GPG` key
---

> Useful link: [GitHub Docs Generating a new GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)



```bash
$ sudo apt install gpg  # for Linux Ubuntu
$ gpg --version
$ gpg --full-gen-key    # generating a new GPG key

$ gpg --list-secret-keys --keyid-format=long
$ gpg --armor --export $MY_GPG_KEY  # Prints the GPG key ID, in ASCII armor format
```



### Enabling Signing `Git` Commits in `VS Code`
---

In `VS Code` -> `Settings` -> Search for `git enable commit signing`


![img](Images/Settings/vs-code-git-commit-signing.png)



### Adding a `GPG` key to `GitHub` account
---

> Useful link: [GitHub Docs Adding a GPG key to your GitHub account](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account)


On `GitHub`, add your **`gpg` key**:
- Click on the **upper-right corner** profile picture to open a **right panel**
- Click on `Settings` from the **right panel**
- Click on `SSH and GPG keys` from the **left panel**
- Click on `New GPG key` (a green button)


Place the `gpg key`, provided by the following command
```bash
$ gpg --armor --export $MY_GPG_KEY 
```

The generated output should have this format:
```
-----BEGIN PGP PUBLIC KEY BLOCK-----

-----END PGP PUBLIC KEY BLOCK-----
```


### ✍️ Automatically signing all `git` commits and tags
---


```bash
$ gpg --list-secret-keys --keyid-format LONG   # the below line is an example
/home/username/.gnupg/secring.gpg
---------------------------------
sec   4096R/ABCDEF1234567890 2024-08-23 [expires: 2026-08-22]



$ git config --global user.signingkey $YOUR_GPG_KEY_ID
$ git config --global commit.gpgSign true
$ git config --global tag.gpgSign true
$ git config --global --list
```


> Now, **every time you `commit`**, it will be `signed` automatically,
> without needing the `-S` flag.

```bash
$ git commit --no-gpg-sign -m "your commit message"  # makes an unsigned commit
```




## Installing `Go`
---


```bash
$ sudo snap install --classic go
$ sudo apt install -y golang
```
Or:
```bash
$ sudo apt remove -y golang-go
$ sudo apt remove -y --autoremove golang-go

$ wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz

$ sudo rm -rf /usr/local/go
$ sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz

$ export PATH=$PATH:/usr/local/go/bin
$ echo "export PATH=$PATH:/usr/local/go/bin" > ~/.bashrc
$ source ~/.bashrc  # or ~/.profile or ~/.zshrc
```



## `Charm CLI` | `Freeze`
---



<!-- Create images of code from your terminal (ft. Freeze) -->
<div style="border: 1px solid #ddd; padding: 10px; max-width: 300px; position: relative; display: inline-block;">
	<a href="https://www.youtube.com/shorts/Mt7AakbyhbY?feature=share" target="_blank" style="display: block; position: relative;">
		<!--  Thumbnail -->
		<img src="https://i.ytimg.com/vi/Mt7AakbyhbY/hq720_2.jpg?sqp=-oaymwEoCIAKENAF8quKqQMcGADwAQH4AbYIgAKAD4oCDAgAEAEYZSBLKEswDw==&rs=AOn4CLB5seIjROPtHUIBeacTTlJSTEVCxQ" alt="YouTube Thumbnail" style="width: 100%; display: block;">
		<!-- Play button in the center -->
		<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 60px; height: 60px; background: rgba(255, 0, 0, 0.8); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
			<div style="width: 0; height: 0; border-left: 15px solid white; border-top: 10px solid transparent; border-bottom: 10px solid transparent;"></div>
		</div>
		<!-- Black rectangle with duration at bottom-right -->
		<div style="position: absolute; bottom: 8px; right: 8px; background: rgba(0, 0, 0, 0.8); color: white; padding: 2px 6px; font-size: 12px; border-radius: 3px;">
			0:39
		</div>
	</a>
	<div style="margin: 0 auto; width: 90%; text-align: left;">
		<!-- Text of URL -->
		<p style="margin: 10px 0;"><a href="https://www.youtube.com/shorts/Mt7AakbyhbY?feature=share" target="_blank">https://www.youtube.com/shorts/Mt7AakbyhbY?feature=share</a></p>
		<!-- Separation line -->
		<hr style="border: 0; height: 1px; background: #ddd; margin: 10px 0;">
		<!-- Text of Title -->
		<p style="margin: 10px 0;"><a href="https://www.youtube.com/shorts/Mt7AakbyhbY?feature=share" target="_blank">Create images of code from your terminal (ft. Freeze)</a></p>
	</div>
</div>
<br>
<br>


> Check out this GitHub repo: <https://github.com/charmbracelet/freeze.git>.



```bash
$ git clone https://github.com/charmbracelet/freeze.git
$ cd freeze
$ go mod tidy
$ go build
$ go install

# Instead of '~/.bashrc', it can be '~/.profile'
$ echo "export PATH=$PATH:$HOME/go/bin" ~/.bashrc
$ source ~/.bashrc

$ cd ../
$ rm -rf freeze
```


> `freeze` takes **screenshots** of code **snippets**.
> 
> Don't use it for entire files!
>
> Use `freeze` for maximum 50 +- lines of code.



```bash
$ which freeze
$ freeze --help
```




How to use `freeze`:

```bash
$ freeze --execute "ls -lah"

$ frreze artichoke.hs -o artichoke.png
```



Results:
![img](Images/cmds/freeze_1.png)
![img](Images/cmds/freeze_2.png)
![img](Images/cmds/freeze_3.png)





## `Charm CLI` | `Glow`
---


> Render markdown on the CLI.

<!-- The best markdown reader for your terminal // Glow #shorts -->
<div style="border: 1px solid #ddd; padding: 10px; max-width: 300px; position: relative; display: inline-block;">
	<a href="https://www.youtube.com/shorts/Nl9pcj79byY?feature=share" target="_blank" style="display: block; position: relative;">
		<!--  Thumbnail -->
		<img src="https://i.ytimg.com/vi/Nl9pcj79byY/hq720_2.jpg?sqp=-oaymwEoCIAKENAF8quKqQMcGADwAQH4AbYIgAKAD4oCDAgAEAEYUiBLKGUwDw==&rs=AOn4CLClvVcM6289q8lejauts8PnrtDRBw" alt="YouTube Thumbnail" style="width: 100%; display: block;">
		<!-- Play button in the center -->
		<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 60px; height: 60px; background: rgba(255, 0, 0, 0.8); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
			<div style="width: 0; height: 0; border-left: 15px solid white; border-top: 10px solid transparent; border-bottom: 10px solid transparent;"></div>
		</div>
		<!-- Black rectangle with duration at bottom-right -->
		<div style="position: absolute; bottom: 8px; right: 8px; background: rgba(0, 0, 0, 0.8); color: white; padding: 2px 6px; font-size: 12px; border-radius: 3px;">
			0:48
		</div>
	</a>
	<div style="margin: 0 auto; width: 90%; text-align: left;">
		<!-- Text of URL -->
		<p style="margin: 10px 0;"><a href="https://www.youtube.com/shorts/Nl9pcj79byY?feature=share" target="_blank">https://www.youtube.com/shorts/Nl9pcj79byY?feature=share</a></p>
		<!-- Separation line -->
		<hr style="border: 0; height: 1px; background: #ddd; margin: 10px 0;">
		<!-- Text of Title -->
		<p style="margin: 10px 0;"><a href="https://www.youtube.com/shorts/Nl9pcj79byY?feature=share" target="_blank">The best markdown reader for your terminal // Glow #shorts</a></p>
	</div>
</div>
<br>
<br>



<!-- Glow: The Trailer -->
<div style="border: 1px solid #ddd; padding: 10px; max-width: 300px; position: relative; display: inline-block;">
	<a href="https://youtu.be/LSdeT5MTMLE" target="_blank" style="display: block; position: relative;">
		<!--  Thumbnail -->
		<img src="https://i.ytimg.com/vi/LSdeT5MTMLE/hqdefault.jpg?sqp=-oaymwEXCJADEOABSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCxs2wVVe4nu-D3bGwM-dbZODYPwA" alt="YouTube Thumbnail" style="width: 100%; display: block;">
		<!-- Play button in the center -->
		<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 60px; height: 60px; background: rgba(255, 0, 0, 0.8); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
			<div style="width: 0; height: 0; border-left: 15px solid white; border-top: 10px solid transparent; border-bottom: 10px solid transparent;"></div>
		</div>
		<!-- Black rectangle with duration at bottom-right -->
		<div style="position: absolute; bottom: 8px; right: 8px; background: rgba(0, 0, 0, 0.8); color: white; padding: 2px 6px; font-size: 12px; border-radius: 3px;">
			0:30
		</div>
	</a>
	<div style="margin: 0 auto; width: 90%; text-align: left;">
		<!-- Text of URL -->
		<p style="margin: 10px 0;"><a href="https://youtu.be/LSdeT5MTMLE" target="_blank">https://youtu.be/LSdeT5MTMLE</a></p>
		<!-- Separation line -->
		<hr style="border: 0; height: 1px; background: #ddd; margin: 10px 0;">
		<!-- Text of Title -->
		<p style="margin: 10px 0;"><a href="https://youtu.be/LSdeT5MTMLE" target="_blank">Glow: The Trailer</a></p>
	</div>
</div>
<br>
<br>



> Check out this GitHub repo: <https://github.com/charmbracelet/glow.git>


```bash
# Installation
go install github.com/charmbracelet/glow@latest
```


```bash
# Checking the installation
$ which glow
$ glow --help
```



`glow` is an excellent **CLI** tool for viewing and editing
Markdown files directly in the terminal.

To view a specific Markdown file, simply pass the file path (e.g., `*.md`) to `glow`. 

When used without arguments,
`glow` will automatically scan the current working directory and its subdirectories 
for Markdown files, allowing you to select one for viewing.




## `Charm CLI` | `Pop`
---


<!-- Click this if you hate writing emails (=____=) -->
<div style="border: 1px solid #ddd; padding: 10px; max-width: 300px; position: relative; display: inline-block;">
	<a href="https://www.youtube.com/shorts/cFCejHDsaQU?feature=share" target="_blank" style="display: block; position: relative;">
		<!--  Thumbnail -->
		<img src="https://i.ytimg.com/vi/cFCejHDsaQU/hq720_2.jpg?sqp=-oaymwEoCIAKENAF8quKqQMcGADwAQH4AbYIgAKAD4oCDAgAEAEYNiAiKH8wDw==&rs=AOn4CLAms4Ytx469syTO1WiQHQ_-YF7qTA" alt="YouTube Thumbnail" style="width: 100%; display: block;">
		<!-- Play button in the center -->
		<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 60px; height: 60px; background: rgba(255, 0, 0, 0.8); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
			<div style="width: 0; height: 0; border-left: 15px solid white; border-top: 10px solid transparent; border-bottom: 10px solid transparent;"></div>
		</div>
		<!-- Black rectangle with duration at bottom-right -->
		<div style="position: absolute; bottom: 8px; right: 8px; background: rgba(0, 0, 0, 0.8); color: white; padding: 2px 6px; font-size: 12px; border-radius: 3px;">
			0:51
		</div>
	</a>
	<div style="margin: 0 auto; width: 90%; text-align: left;">
		<!-- Text of URL -->
		<p style="margin: 10px 0;"><a href="https://www.youtube.com/shorts/cFCejHDsaQU?feature=share" target="_blank">https://www.youtube.com/shorts/cFCejHDsaQU?feature=share</a></p>
		<!-- Separation line -->
		<hr style="border: 0; height: 1px; background: #ddd; margin: 10px 0;">
		<!-- Text of Title -->
		<p style="margin: 10px 0;"><a href="https://www.youtube.com/shorts/cFCejHDsaQU?feature=share" target="_blank">Click this if you hate writing emails (=____=)</a></p>
	</div>
</div>




> Checkout this GitHub repo: <https://github.com/charmbracelet/pop.git>


Installation
```bash
$ go install github.com/charmbracelet/pop@latest
```



```bash
$ which pop
$ pop --version
```



TODO: get configuration



## 🗑️ Uninstalling Utilities
---

Deleting a command is as simple as installing it,
the only difference in the one-liner is a word specified to the package manager.

> 🗑️ `remove` will take place of `install` argument.


```sh
rustup self uninstall			# uninstall cargo

sudo apt remove xfce4-terminal

sudo apt remove cmatrix
sudo snap remove code
sudo snap remove intellij-idea-ultimate
sudo snap remove rustrover
sudo snap remove clion

sudo apt remove nano
sudo snap remove helix
# cargo uninstall helix			# if installed with cargo

sudo snap remove zellij
# cargo uninstall zellij		# if installed with cargo


cargo uninstall ripgrep			# rg command

sudo apt remove fd-find

sudo snap remove onefetch
sudo apt-get remove neofetch


sudo snap remove discord
sudo snap remove spotify

sudo snap remove exa

cargo remove hurl
cargo uninstall bat
cargo uninstall lsd
cargo uninstall rusty-rain
cargo uninstall tokei

sudo npm uninstall -g birthday

# unsetting git info
git config --global --unset user.name
git config --global --unset user.email
```


