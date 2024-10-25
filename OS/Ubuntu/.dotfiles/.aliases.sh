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
alias clip='xclip -selection clipboard'


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
