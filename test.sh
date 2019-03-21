#!/usr/bin/env python3

import glob
import os
import subprocess
import sys

def main(exe, dir):
    files = glob.glob(dir + '/*.in')
    for f in files:
        directory, f_name = os.path.dirname(f), os.path.basename(f)
        name, ext = os.path.splitext(f_name)
        if ext != '.in':
            print("Test file name not ending with '.in'", file=sys.stderr)
            return
        with open(f) as x:
            p = subprocess.Popen([exe], stdout=subprocess.PIPE,
                                        stderr=subprocess.PIPE, stdin=x)
            out, err = p.communicate()
            with open(os.path.join(directory, name + '.out'), 'rb') as f_out:
                if f_out.read() != out:
                    print(f"\u274C TEST {f} FAILED")
                    continue
            with open(os.path.join(directory, name + '.err'), 'rb') as f_err:
                if f_err.read() != err:
                    print(f"\u274C TEST {f} FAILED")
                    continue
            print(f"\u2713 TEST {f} PASSED")


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
            


