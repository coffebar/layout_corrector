Layout corrector script
================
Script to change keyboard layout for already written line (RU/EN).

## Note: using inside terminal emulator in not supported!

Written for Linux as an alternative to [Punto switcher](https://punto.yandex.ru/).

## How to use
You need to bind `layout_corrector/layot_corrector.sh` 
to a key 'Scroll Lock'.

Do not forget to give execute permissions:
```chmod +x layout_corrector/layot_corrector.sh```


### Requires
    
    - python3
    - xsel
    - xvkbd
    - xautomation
    - xdotool
    
Install requirements on Ubuntu\Mint:
```
sudo apt install python3 xdotool xsel xvkbd xautomation
```

You can use command `python3 layout_corrector/test.py` to check that all dependencies are satisfied.
