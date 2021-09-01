
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

### EXPORT
export TERM="xterm-256color"                     
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#PS1 show prompt

PS1='\u@\h \W\$ '
export PS1;


#-----------
#aliases
#-----------
alias dphd="cd /Users/giulio/Dropbox/projects" 		#go to progect folder in dropbox
alias clc="clear" 					#clear terminal screen
alias o="open ." 					#open currend directory in finder
alias odphd="open /Users/giulio/Dropbox/projects" 	#open dropbox folder in finder
alias vim="nvim" 					#using neovim
alias la="ls -A" 					#list all
alias df='df -h'                          		# human-readable sizes


