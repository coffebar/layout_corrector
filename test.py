#!/usr/bin/env python
# -*- coding: utf-8 -*-
from subprocess import call
from corrector import correct

__author__ = 'Odarchenko N.D.'


if __name__ == '__main__':
    print('Keyboard layout corrector. \r\nTesting system environment...')
    commands = (
        ("xclip -out -selection c > /dev/null", 'You need to install xclip'),
        ('setxkbmap > /dev/null', 'You need to install setxkbmap'),
        ("xvkbd -xsendevent -text '\C'>/dev/null", 'You need to install xvkbd'),
    )
    try:
        for command, error_text in commands:
            ret_code = call(command, shell=True)
            if ret_code != 0:
                raise OSError(error_text)
    except OSError as e:
        print('\n' + '!' * 30)
        print("Test failed:\n" + str(e))
        print('!' * 30 + '\n')
        exit(1)
    print('Test example:')
    test = 'ghbdtn'
    print('"%s" -> "%s"' % (test, correct(test)))
    print('Test passed.')