Layout corrector script
================
Script to change keyboard layout for already written line (RU/EN).

## Note: using inside terminal emulator in not supported!

Written for Linux as an alternative to [Punto switcher](https://punto.yandex.ru/).

## How to use
You need to bind `layot_corrector.sh` 
to a combination of keys CTRL + ALT + Z
or just 'Scroll Lock' key or something else you want.

Do not forget to give execute permissions:
```chmod +x layout_corrector/layot_corrector.sh```


### Requires
    
    - python3
    - xsel
    - xvkbd
    - setxkbmap
    
Install requirements on Ubuntu\Mint:
```
sudo apt install python3 xsel xvkbd x11-xkb-utils
```

You can use command `python3 layout_corrector/test.py` to check that all dependencies are satisfied.
