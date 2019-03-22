#!/usr/bin/python3

from shutil import copyfile
from os import getcwd

cwd = getcwd()

info = '''
Choose out when there's comment without newline (ends with EOF):
error - there should be error message printed (cause line without newline)
nothing - nothing should be printed (cause it's a comment)
Please write your decision (error/nothing): '''

decision = input(info)

while decision != "error" and decision != "nothing":
	decision = input("Please write 'error' or 'nothing': ")

print("You choose: " + decision)

def copyfileverbose(src, dst):
	print("Copying " + src + " to " + dst)
	copyfile(src, dst)

if decision == "error":
	copyfileverbose(cwd + "/storage/end5.errorvariant.out", cwd + "/end5.decided.out")
	copyfileverbose(cwd + "/storage/end5.errorvariant.err", cwd + "/end5.decided.err")

if decision == "nothing":
	copyfileverbose(cwd + "/storage/end5.noerrorvariant.out", cwd + "/end5.decided.out")
	copyfileverbose(cwd + "/storage/end5.noerrorvariant.err", cwd + "/end5.decided.err")

print()
