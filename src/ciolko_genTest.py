#!/usr/bin/python3
import random

testLength = 100
maxHistoryLength = 10 # Shorter legths make better edge cases
maxEnergy = 20
# maxEnergy can be up to 18446744073709551615

def writeHistory():
    length = random.randint(1, maxHistoryLength)

    for i in range(length):
        print(random.randint(0, 3), end="")

random.seed(13377)

for i in range(testLength):
    curCommand = random.randint(0, 6)

    #Commands:
    # 0 - DECLARE <history>
    # 1 - REMOVE <history>
    # 2 - VALID <history>
    # 3 - EQUAL <history1> <history2>
    # 4 - ENERGY <history>
    # 5 ENERGY <history> <value>
    # 6 Comment or newline

    if(curCommand == 0): # Declare
        print("DECLARE ", end="")
        writeHistory()
        print()

    if(curCommand == 1): # Remove
        print("REMOVE ", end="")
        writeHistory()
        print()

    if(curCommand == 2): # Valid
        print("VALID ", end="")
        writeHistory()
        print()

    if(curCommand == 3): # Equal
        print("EQUAL ", end="")
        writeHistory()
        print(" ", end="")
        writeHistory()
        print()
        
    if(curCommand == 4): # Energy <history>
        print("ENERGY ", end = "")
        writeHistory()
        print()

    if(curCommand == 5): # Energy <history> <value>
        print("ENERGY ", end = "")
        writeHistory()
        print(" ", end="")
        print(random.randint(1, maxEnergy))

    if(curCommand == 6): # Comment or newline
        if(random.randint(0, 1) == 1):
            print("#  comment asd  dask dsamkd asmkd kaskd msakdmksad mksam dmk", end = "")
            writeHistory()
            print()
        else:
            print()