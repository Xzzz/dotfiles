# dotfiles

@Xzzz Linux desktop config files

## What's included

- **nvim** — Neovim config (Lua, lazy.nvim)

## Setup on a new machine

```bash
git clone --bare git@github.com:Xzz/dotfiles.git ~/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles checkout
dotfiles config status.showUntrackedFiles no
```

## Usage

```bash
dotfiles add -f ~/.config/cool_stuff
dotfiles commit -m "Added cool stuff"
dotfiles push
```
