#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
from subprocess import call

__author__ = 'Odarchenko N.D.'

ru = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
ru_to_en = 'f,dult`;pbqrkvyjghcnea[wxio]sm\'.zF<DULT~:PBQRKVYJGHCNEA{WXIO}SM">Z'


def has_chars(s, chars_list):
    for sym in s:
        for ch in chars_list:
            if ch == sym:
                return True
    return False


def correct(bad_str):
    if has_chars(bad_str, ru):
        trans_tab = str.maketrans(ru, ru_to_en)
        call(['setxkbmap', '-layout', 'us,ru'])
    else:
        trans_tab = str.maketrans(ru_to_en, ru)
        call(['setxkbmap', '-layout', 'ru,us'])
    return bad_str.translate(trans_tab)


if __name__ == '__main__':
    arg_len = len(sys.argv)
    if arg_len == 1:
        print()
    else:
        print(correct(sys.argv[1]))
