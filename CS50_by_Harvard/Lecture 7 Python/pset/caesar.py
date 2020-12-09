import sys
from sys import argv
from cs50 import get_string


if len(sys.argv) != 2:
    print("python caesar.py k")
    sys.exit(1)

k = int(sys.argv[1])

plaintext = get_string("plaintext: ")
print("ciphertext: ", end="")

for c in plaintext:
    if c.islower():
        new_c = chr((ord(c) - 97 + k) % 26 + 97)
        print(f"{new_c}", end="")
    elif c.isupper():
        new_c = chr((ord(c) - 65 + k) % 26 + 65)
        print(f"{new_c}", end="")
    else:
        print(f"{c}", end="")
print()