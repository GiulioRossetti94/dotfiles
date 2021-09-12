### EXPORT
export CLICOLOR=1
export TERM="xterm-256color"                     
export LSCOLORS=GxFxCxDxBxegedabagaced

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
alias dphd="cd /Users/giulio/Dropbox/projects" 		#go to progect folder in dropbox
alias clc="clear" 					#clear terminal screen
alias o="open ." 					#open currend directory in finder
alias odphd="open /Users/giulio/Dropbox/projects" 	#open dropbox folder in finder
alias vim="nvim" 					#using neovim
alias la="ls -A" 					#list all
alias df='df -h'                          		# human-readable sizes
alias home='cd ~'

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

export PATH="/opt/shell-color-scripts:$PATH"
### RANDOM COLOR SCRIPT ###
colorscript.sh random

##########################
#  USELFUL FUNCTIONS :)  #
##########################

### create folders for new project. usage: newproject <name_project>
#-----------------------------------------------------------------------------
newproject ()

{
    mkdir -pv -- "$1"/code/{python,matlab,other}
    mkdir -pv -- "$1"/{data,literature,putput,tables}
}
#-----------------------------------------------------------------------------

###preview csv files in terminal
#-----------------------------------------------------------------------------
function csvpreview()
{
      sed 's/,,/, ,/g;s/,,/, ,/g' "$@" | column -s, -t | less -#2 -N -S
}

#-----------------------------------------------------------------------------

###create a folder for new presentation with preable and bib file
#-----------------------------------------------------------------------------
newpresentation ()
{
    #create the folder for the presentation with format
    #slides_ddmmyy and put preamble and bib files in it
    mkdir -p -- slides_$(date +"%d-%m-%Y")&& \
        cp ~/my_templates/latex-slides/{preamble.tex,references.bib} "$_"
    #create folder for auxiliary files
    mkdir -p -- slides_$(date +"%d-%m-%Y")/aux
}
#-----------------------------------------------------------------------------
