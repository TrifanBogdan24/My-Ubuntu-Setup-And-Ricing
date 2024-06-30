# My `Ubuntu` Setup


Here is my configuration for the `Linux UBUNTU` terminal.

🔁 Take it as a **backup** and easy way to transition from one PC or VM to another.





## Installing commands

> ❌ Do not execute the commands below as a script
>
> Some may expect user input.
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


sudo snap install discord
sudo snapp install spotify
```





## Configuration File (`~/.bashrc`)


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
alias youtube='open https://www.youtube.com/ &> /dev/null'          # opens YouTube in Google Chrome
alias periodic-table='npx periodic-table-cli'
alias world-map='telnet mapscii.me'
alias recent-files='ls -ltrh'
alias cmd-help='compgen -c | fzf | xargs man'
alias hacking-terminal='docker run --rm -it bcbcarl/hollywood'       # `CTRL-C` and `exit` to stop


# opens IDEs in current directory
alias vscode='code .'
alias open-rustrover='rustrover . &> /dev/null &'
alias open-intellij='intellij-idea-ultimate . &> /dev/null &'
alias open-clion='clion . &> /dev/null &'





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




neofetch  --ascii_distro arch
```



```bash
$ source ~/.bashrc
$ reset
```


## Uninstalling Commands


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
