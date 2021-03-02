#!/usr/bin/env python
# -*- coding: utf-8 -*-
from subprocess import call
from corrector import correct


def check_env():
    commands = (
        ("xsel --version", 'You need to install xsel'),
        ("xdotool --help", 'You need to install xdotool'),
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


if __name__ == '__main__':
    print('Keyboard layout corrector. \r\nTesting system environment...')
    check_env()

    print('Test example:')
    test_str = 'ghbdtn'
    corrected_str = correct(test_str)

    print('"%s" -> "%s"' % (test_str, corrected_str))

    if corrected_str == 'привет':
        print('Test passed.')
