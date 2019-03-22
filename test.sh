#!/usr/bin/env python3

import glob
import os
import sys
from time import time
from subprocess import Popen, PIPE

try:
    from termcolor import cprint
except ModuleNotFoundError:
    def cprint(a, b, c):
        print(a)

def test_file(exe, input, output, error):
    with open(output, 'rb') as o_:
        out_expected = o_.read()

    with open(error, 'rb') as e_:
        err_expected = e_.read()

    with open(input) as f_input:
        start = time()
        p = Popen([exe], stdout=PIPE, stderr=PIPE, stdin=f_input)
        out, err = p.communicate()
        elapsed = time() - start

    if p.returncode != 0 or out != out_expected or err != err_expected:
        cprint("\u274C TEST {} FAILED".format(input), 'white', 'on_red')
        return
    
    cprint("\u2713 TEST {0} PASSED, TIME: {1:.2f}".format(input, elapsed),'white','on_green')


    with open(input) as f_input:
        p = Popen(['valgrind', '--leak-check=full',  '--show-leak-kinds=all',
        '--errors-for-leak-kinds=all', exe], stdout=PIPE, stderr=PIPE, stdin=f_input)
        _, err = p.communicate()

    err = err.decode().splitlines()
    x = min([i for i, line in enumerate(err) if 'SUMMARY' in line]) 
    print(*err[x:], sep='\n')

def main(exe, dir):
    files = glob.glob(dir + '/*.in')
    for f in files:
        name, ext = os.path.splitext(f)
        try:
            test_file(exe, name + ext, name + '.out', name + '.err')
        except FileNotFoundError:
            cprint("ONE OF THE FILES FOR {} WEREN\'T NOT FOUND".format(f), "white", "on_yellow")

    


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
            
