### EXPORT
export CLICOLOR=1
export TERM="xterm-256color"                     
export LSCOLORS=GxFxCxDxBxegedabagaced
#path colorscheme
export PATH="/opt/shell-color-scripts:$PATH"
#manage command history
export HISTSIZE=10000                                   #big history
export HISTCONTROL=ignoredups:erasedups                 #no duplicate entries
export HISTIGNORE="&:[ ]*:exit:ls:history:clear"  #ignore some commands in hist

#PS1 show prompt
PS1='\u@\h \W\$ '
export PS1;


#-----------
#aliases
#-----------
alias dphd="cd /Users/giulio/Dropbox/projects" 		#go to project folder in dropbox
alias JJ="cd /Users/giulio/Dropbox/journal" 		#go to journal
alias DW="cd /Users/giulio/Downloads" 		#go to progect folder in dropbox
alias DE="cd /Users/giulio/Desktop" 		#go to progect folder in dropbox
alias clc="clear" 					#clear terminal screen
alias o="open ." 					#open currend directory in finder
alias odphd="open /Users/giulio/Dropbox/projects" 	#open dropbox folder in finder
alias vim="nvim" 					#using neovim
alias la="ls -A" 					#list all
alias df='df -h'                          		# human-readable sizes
alias home='cd ~'
alias color='colorscript.sh random'
alias bib="cd /Users/giulio/Dropbox/bibmaster" # go to bib master folder in dropbox
alias cbib="nvim /Users/giulio/Dropbox/bibmaster/mybibfile.bib" # modify bibmaster file
alias OO="cd /Users/giulio/Phd/GiuliosVault"  # go to obsidian vault
alias nvconf="cd /Users/giulio/.config/nvim/"
# bare git repo alias for dotfiles
alias config='/usr/bin/git --git-dir=/Users/giulio/dotfiles/ --work-tree=/Users/giulio'

# Interactive operation...

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#-----------
#pyenv settings
#-----------


#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

#-----------
#conda settings :
#-----------

#conda things 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

### RANDOM COLOR SCRIPT ###
colorscript.sh random


alias luamake=/Users/giulio/tools/lua-language-server/3rd/luamake/luamake

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/Users/giulio/.juliaup/bin:*)
        ;;

    *)
        export PATH=/Users/giulio/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
