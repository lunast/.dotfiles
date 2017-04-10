# -*- coding: utf-8 -*-
import gtk
import getpass

def mkkey(plain, key):
    keya = ''
    len1 = len(plain)
    len2 = len(key)
    for i in range(0, int(len1/len2)):
        keya += key
    keya += key[:len1%len2]
    return keya

def isad(c):
    if c.islower():
        return 'a'
    elif c.isupper():
        return 'A'
    elif c.isdigit():
        return '0'
    else:
        return 'FALSE'

def encrypt(plain, key):
    result = ''
    for p, k in zip(plain, mkkey(plain, key)):
        case_plain = isad(p)
        case_key = isad(k)
        if case_plain == '0':
            case_num = 10
        elif case_plain == 'a' or case_plain == 'A':
            case_num = 26
        else:
            return '\0'

        if case_key == 'FALSE':
            return '\0'

        code = (ord(p) - ord(case_plain) + ord(k) - ord(case_key))%case_num + ord(case_plain)
        result += chr(code)
    return result

if __name__ == '__main__':
    clipboard = gtk.clipboard_get()
    plain = getpass.getpass('Input plain text: ')
    key = getpass.getpass('Input keyword: ')
    result = encrypt(plain, key)
    if result == '\0':
        print 'Encryption has failed...'
    else:
        print 'Encryption has succeeded!'
        print 'Cipher text has been copied to a clipboard.'
        clipboard.set_text(result)
        clipboard.store();
