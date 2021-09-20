

#-----------
# make bash config working across unix/linux platoforms. ie not using bash_profile for macos only
#-----------

#check if bashrc

if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi

source .bash_prompt

#check if bash_prompt
#if [ -r ~/.bash_prompt ]; then
#    source ~/.bash_prompt
#fi

# Load our dotfiles like ~/.bash_prompt, etc…
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{functions}; do
    [ -r "$file" ] && source "$file"
done
