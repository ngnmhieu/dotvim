## Linux KDE

### Caplock -> ESC
```
Settings -> Keyboard -> Advanced
Check 'Configure keyboard options'
Check 'Make Caps Lock an additional ESC'
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
Use [Karabiner-Element](https://github.com/tekezo/Karabiner-Elements) \mm/.

### Key repeat 
```
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```