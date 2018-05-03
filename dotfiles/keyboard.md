## Linux

### Caplock -> ESC

**KDE**
```
Settings -> Keyboard -> Advanced
Check 'Configure keyboard options'
Check 'Make Caps Lock an additional ESC'
```

**Others**
```
sudo apt install xcape
System Preferences > Keyboard Layout > Options... > CapsLock as additional ESC
```

### Umlaut
1. edit /usr/share/X11/xkb/symbols/us (international) 
    key <AC01> { [	   a,          A,    adiaeresis,       Adiaeresis ] };
    key <AD09> { [	   o,          O,    odiaeresis,       Odiaeresis ] };
    key <AD07> { [	   u,          U,    udiaeresis,       Udiaeresis ] };
    key <AC02> { [	   s,          S,        ssharp,          section ] };
2. sudo rm *.xkm in /var/lib/xkb
3. reselect keyboard method

**Hint:** In KDE just use the eu keyboard.

## macOS

### Key mapping
[Karabiner-Element](https://github.com/tekezo/Karabiner-Elements) 🤘🏻🤘🏻🤘🏻

Use saved configuration: 

```
$ rm ~/.config/karabiner/karabiner.json
$ ln -s ~/.vim/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
```

### Key repeat 
```
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
```
