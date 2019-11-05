# Setup

## Clone repo
```
git clone --depth 1 -- https://github.com/dev4mobile/dotfiles  $HOME/develop
```
## Link bin/init.sh to /usr/local/bin
```
DEV=$HOME/develop && ln -s $DEV/dotfiles/bin/init.sh dotfiles
```
## Download your private `.ssh` config files
For example: `https://drive.google.com/drive/folders/1sMrOCtl8xeqlclPdW_VCP-oteX47u1QY`
## Update dotfile config
```
dotfiles
```

