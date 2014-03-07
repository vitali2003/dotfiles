#!/bin/bash

# Run with root privilages
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
fi

cd ~/

# Remove unwanted folders from home.
echo "Removing unwanted home directory folders"
rm -r ~/Music ~/Videos ~/Templates ~/examples.desktop
# Probably does not work to prevent recreation. Kept for historical reasons.
sed -e '/Music\"$\|Videos\"$\|Templates\"$/s/^/#/g' -i ~/.config/user-dirs.dirs
# Disable automatic creation of afforementioned files
echo "enabled=False" >> ~/.config/user-dirs.conf

# Install software
echo "Installing must-have software"
apt-get update;
software=( "vim" "git" "tmux" "chromium-browser" "ipython" "htop"
           "ack-grep" "autojump" "zsh" "vlc browser-plugin-vlc"
           "python-pip" "okular" "openjdk-7-jdk" "g++" "xclip" 
           "vim-gtk" )
for program in ${software[@]}
do
    echo "Y" | apt-get install $program
done
git config --global user.email gunnarjv@gmail.com
git config --global user.name gunnarjv
git config --global push.default simple

# Install oh-my-zsh
su gunnarjv -c "wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh;"
# "-" as filename in wget is supposed to be stream, but a file is also created.
rm "–"
# Make Zsh default
su gunnarjv -c "chsh -s /bin/zsh;"

# i3
echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list;
apt-get update;
apt-get --allow-unauthenticated install sur5r-keyring;
apt-get update;
echo "Y" | apt-get install i3;

# Spotify
apt-add-repository -y "deb http://repository.spotify.com stable non-free"; 
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59;
apt-get update -qq;
echo "Y" | apt-get install spotify-client;

# Sublime text 2
echo "\n" | add-apt-repository ppa:webupd8team/sublime-text-2
apt-get update
apt-get install sublime-text

# Set up dotfiles
echo "Cloning my dotfiles repo"
su gunnarjv -c "git clone https://github.com/gunnarjv/dotfiles.git .dotfiles"

echo "Backing up old dotfiles"
old_dotfiles_dir=".dotfiles_old/"
mkdir -p $old_dotfiles_dir
dotfiles=( "i3" "vim" "vimrc" "zshrc" "bash_aliases"
                   "tmux.conf" "xmodmaprc" "vimperatorrc"
                   "gconf" )
for dotfile_old in ${dotfiles[@]}
do
    mv ~/.$dotfile_old $old_dotfiles_dir
done
mv ~/bin $old_dotfiles_dir

echo "Creating symlinks to dotfiles repo"
for dotfile in ${dotfiles[@]}
do
    ln -s ~/.dotfiles/$dotfile ~/.$dotfile
done
ln -s ~/.dotfiles/bin ~/bin
ln -s ~/.dotfiles/prose.zsh-theme ~/.oh-my-zsh/themes/prose.zsh-theme

# Installing vim plugins
echo "Installing vim plugins"
su gunnarjv -c "git clone https://github.com/scrooloose/nerdtree.git .vim/bundle/nerdtree"
# exuberant-ctags for taglist.vim
apt-get install exuberant-ctags
su gunnarjv -c "git clone https://github.com/vim-scripts/taglist.vim.git .vim/bundle/taglist.vim"
su gunnarjv -c "git clone https://github.com/kien/ctrlp.vim.git .vim/bundle/ctrlp.vim"

# Install terminal theme
echo "Installing terminal theme"
su gunnarjv -c "git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git .solarized-terminal";

# Let lid closing suspend computer in i3
mkdir /etc/acpi/local
echo "#\!/bin/bash/\n\n/home/gunnarjv/bin/susp" >> /etc/acpi/local/lid.sh.post

echo "TODO:"
echo "Create an ssh key:"
echo "'ssh-keygen -t rsa -C 'gunnarjv@gmail.com''"
echo "Install terminal theme:"
echo "'./.solarized-terminal/install.sh'"
echo "Set vim as default editor:"
echo "'sudo update-alternatives --config editor'"
echo "Install dropbox (no command here)."
