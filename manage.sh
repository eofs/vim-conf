#!/usr/bin/env sh

target="$HOME/.vim.eofs"
backups="$HOME/.vim.backups"


info() {
    time=`date +"%d-%m-%Y %T"`
    echo "[$time] [vim-eofs] $@"
}

die() {
    info "$1"
    exit 1
}

# Create a symbolic link if it does not exists
symlink() {
    if [ ! -e $2 ]; then
        ln -s $1 $2
    fi
}

# Backup current VIM configuration
backup() {
    if [ ! -e $backups ]; then
        info "Creating backup directory $backups"
        mkdir -p $backups
    fi

    info "Backing up current vim configuration"
    today=`date +%Y%m%d`
    for i in .vim .vimrc; do
        src="$HOME/$i"
        dst="$backups/$i.$today"
        info "Copying $src to $dst"
        if [ -e $src ] && [ ! -L $src ]; then
            mv $src $dst
        fi
    done
}

# Install configuration
installConf() {
    info "Installing configuration..."
    git clone https://github.com/eofs/vim-conf.git $target
}

# Update configuration
updateConf() {
    info "Updating configuration..."
    cd $target && git pull
}

# Main function
if [ ! -e $target/.git ]; then
    installConf
else
    updateConf
fi

# Take backups
backup

info "Setting up symbolic links"
symlink $target/.vimrc $HOME/.vimrc
symlink $target/.vim $HOME/.vimrc

if [ ! -e $HOME/.vim/bundle/vundle ]; then
    info "Installing Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

info "Installing and updating plugins"
vim +PluginInstall! +PluginClean +qall

[ $? -eq 0 ] || die "Uh oh! Something went wrong..."
info "Happy vim moments!"
