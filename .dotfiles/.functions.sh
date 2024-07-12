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



