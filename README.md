# dotfiles

yet another dotfiles repo.

## dependencies

- zsh
- neovim
- silversearcher-ag

## how to use

just git clone into your home directory.

```bash
chsh -s /bin/zsh
```

## how to make

useful commands used to get this working

### to convert pathogen bundle folder into submodules
```bash
cd .config/nvim/bundle
for file in `ls`; do pushd $file; git remote -v | grep fetch ; popd; done; > scratch
cat scratch| cut -f2 | perl -pne 's/ .*//g' > scratch2
for file in $(cat scratch2); do echo git submodule add $(echo $file) $(echo $file | perl -pe 's/.*\/(.*?)(.vim)?(.git)?$/$1/'); done
```



