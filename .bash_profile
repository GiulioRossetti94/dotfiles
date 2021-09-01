

#-----------
# make bash config working across unix/linux platoforms. ie not using bash_profile for macos only
#-----------

#check if bashrc

if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi
