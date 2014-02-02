#!/bin/bash

#################
# For now the command ./.solarized-terminal/install.sh must 
# be run manually.
#################

# Run with root privilages
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
fi

cd ~/

# Remove unwanted folders from home.
echo "Removing unwanted home directory folders"
#rm -r ~/Music ~/Videos ~/Templates ~/examples.desktop
# Probably does not work to prevent recreation. Kept for historical reasons.
#sed -e '/Music\"$\|Videos\"$\|Templates\"$/s/^/#/g' -i ~/.config/user-dirs.dirs
# Disable automatic creation of afforementioned files
#echo "enabled=False" >> ~/.config/user-dirs.conf

# Install software
echo "Installing must-have software"
#apt-get update;
#echo "Y" | apt-get install vim;
#echo "Y" | apt-get install git;
#git config --global user.email gunnarjv@gmail.com
#git config --global user.name gunnarjv
#git config --global push.default simple
#echo "Y" | apt-get install tmux;
#echo "Y" | apt-get install chromium-browser;
#echo "Y" | apt-get install ipython;
#echo "Y" | apt-get install ack-grep;
#echo "Y" | apt-get install autojump;
#echo "Y" | apt-get install zsh;
#echo "Y" | apt-get install vlc browser-plugin-vlc
#echo "Y" | apt-get install python-pip
#echo "Y" | apt-get install okular

# Install oh-my-zsh
#wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh;
# "-" as filename in wget is supposed to be stream, but a file is also created.
#rm "–"
# Make Zsh default
#chsh -s /bin/zsh;

# i3
#echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list;
#apt-get update;
#apt-get --allow-unauthenticated install sur5r-keyring;
#apt-get update;
#echo "Y" | apt-get install i3;

# Spotify
#apt-add-repository -y "deb http://repository.spotify.com stable non-free"; 
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59;
#apt-get update -qq;
#echo "Y" | apt-get install spotify-client;

# Sublime text 2
#echo "\n" | add-apt-repository ppa:webupd8team/sublime-text-2
#apt-get update
#apt-get install sublime-text

# Set up dotfiles
echo "Cloning my dotfiles repo"
# su gunnarjv -c "git clone https://github.com/gunnarjv/dotfiles.git"

# Currently I'm not sure if I want xmodmaprc
echo "Backing up old dotfiles"
#mkdir -p ".dotfiles_old/"
#mv ~/.i3 ".dotfiles_old/"
#mv ~/.vim ".dotfiles_old/"
#mv ~/.vimrc ".dotfiles_old/"
#mv ~/.bin ".dotfiles_old/"
#mv ~/.zshrc ".dotfiles_old/"
#mv ~/.bash_aliases ".dotfiles_old/"
#mv ~/.tmux.conf ".dotfiles_old/"

# Make symbolic links to repo
echo "Creating symlinks to dotfiles repo"
#ln -s ~/.dotfiles/i3 ~/.i3
#ln -s ~/.dotfiles/vim ~/.vim
#ln -s ~/.dotfiles/vimrc ~/.vimrc
#ln -s ~/.dotfiles/bin ~/bin
#ln -s ~/.dotfiles/zshrc ~/.zshrc
#ln -s ~/.dotfiles/bash_aliases ~/.bash_aliases
#ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
#ln -s ~/.dotfiles/xmodmaprc ~/.xmodmaprc
#ln -s ~/.dotfiles/prose.zsh-theme ~/.oh-my-zsh/themes/prose.zsh-theme

# Installing vim plugins
echo "Installing vim plugins"
su gunnarjv -c "git clone https://github.com/scrooloose/nerdtree.git .vim/bundle/nerdtree"
# exuberant-ctags for taglist.vim
#apt-get install exuberant-ctags
#su gunnarjv -c "git clone https://github.com/vim-scripts/taglist.vim.git .vim/bundle/taglist.vim"
#su gunnarjv -c "git clone https://github.com/kien/ctrlp.vim.git .vim/bundle/ctrlp.vim"

# Install terminal theme
echo "Installing terminal theme"
#su gunnarjv -c "git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git .solarized-terminal";

echo "Remember to run './.solarized-terminal/install.sh
echo "and to install dropbox."
