## Dotfiles
---
![](https://img.shields.io/badge/works%20on-OS%20X-D376B3.svg)

To install these dotfiles you should run the following command:

```
make install-ansible && make install
```

It'll install on your computer:

- python
- neovim
- tmux
- curl
- zsh

Then you should install Neovim plugins (just exec following):

```
:PlugInstall
```

That's all what you need to do to use these dotfiles.

![](https://raw.githubusercontent.com/daynin/dotfiles/master/imgs/dotfiles1.png)

These are my tmux, vim, neovim, editorconfig and zsh configs.

### Tmux

![](https://raw.githubusercontent.com/daynin/dotfiles/master/imgs/dotfiles2.png)

1. Session name
2. Inactive window
3. Active window
4. Active pane
5. Simple date/time info panel

### Tmux hot keys

There are only one thing you should know: you can use <kbd>Ctrl</kbd> + <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd> to jump between panes

### Vim hot keys

First of all, you should know that my <kbd>Leader</kbd> key is <kbd>,</kbd>


| Action        | Binding       | 
| ------------- |:-------------:|
| Toggle nerd tree | <kbd>Ctrl</kbd> + <kbd>n</kbd> |
| Show Ctrl-p panel | <kbd>Ctrl</kbd> + <kbd>p</kbd> |
| Switch buffer | <kbd>Ctrl</kbd> + <kbd>h</kbd> / <kbd>j</kbd> / <kbd>k</kbd> / <kbd>l</kbd> |
| Find and replace word under the cursor | <kbd>Leader</kbd> + <kbd>s</kbd> |

That's all. Remaining keys are default.

### Terminal emulator settings

**NOTE:** You have to set "Droid Sans Mono for Powerline Nerd Font Complete.otf" as a font by default in your terminal emulator.

Like that:

![](https://raw.githubusercontent.com/daynin/dotfiles/master/imgs/terminal-settings.png)
