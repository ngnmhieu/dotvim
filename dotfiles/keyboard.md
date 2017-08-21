### Caplock -> ESC
**In KDE:**
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
