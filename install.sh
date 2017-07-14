cd ~/dotfiles/
cp ./.bashrc ~
cp ./.vimrc ~
cp ./.tmux.conf ~

#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
if [ $TMUX ]; then
    tmux source-file ~/.tmux.conf
fi
