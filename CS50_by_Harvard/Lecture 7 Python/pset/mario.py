from cs50 import get_int


while True:
    n = get_int("Height:""\n")
    if n <= 8 and n >= 1:
        break
for i in range(n):
    for s in range(n-i-1):
        print(" ", end="")
    for j in range(i+1):
        print("#", end="")
    print()

