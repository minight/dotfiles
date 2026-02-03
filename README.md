# dotfiles

yet another dotfiles repo. should mostly be platform agnostic. might have some osx stuff by accident. 

## dependencies

- fish
- i3
- neovim
- silversearcher-ag

## how to use

just git clone into your home directory.

```bash
git@github.com:minight/dotfiles.git
cd dotfiles
./install
bash /home/sean/tmp/dotfiles/.config/fonts/powerline/install.sh
chsh -s "$(command -v fish)"
```

## fish notes

This repo links specific fish config files into `~/.config/fish`, but it does **not** manage `~/.config/fish/fish_variables`.
That file stores fish “universal variables” (machine-local state), and keeping it local avoids accidental clobbering.
