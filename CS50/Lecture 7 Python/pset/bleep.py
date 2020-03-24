import sys
from cs50 import get_string
from sys import argv

def main():
    if len(sys.argv) != 2:
        print("Usage: python bleep.py dictionary")
        sys.exit(1)

    message = get_string("What message would you like to sensor?""\n")
    word = message.split()
    wordlower = message.lower().split()
    wordcopy = message.lower().split()

    load(argv[1])

#list像array一样要一个个筛选

#找到交集，置换交集内容为*号
    x = [iterm for iterm in wordlower if iterm in words]

    for i in range(len(wordlower)):
        for j in range(len(x)):
            if wordlower[i] == x[j]:
                wordlower[i] = len(wordlower[i]) *"*"

# A the heck (word)
# a the heck (wordcopy)
# a the **** (wordlower)
# A the **** (answer)

# 最终要做的是 1、找回所有被大写的项（y）  2、找到bleep掉的项（z)
# 找到最终需要替换的项（h）：被大写但没被bleep掉的项
# wordcopy作为一个中介, 可以用小写的项联通两边

    y = [iterm for iterm in wordcopy if iterm not in word]
    z = [iterm for iterm in wordcopy if iterm not in wordlower]
    h = [iterm for iterm in y if iterm not in z]

    for i in range(len(wordlower)):
        for j in range(len(h)):
            if wordlower[i] == h[j]:
                wordlower[i] = word[i]

#最后打印，wordlower经过了2次变化。
    for i in range(len(wordlower)):
        print(wordlower[i],"", end="")

    print()

words = []
def load(banned):
    file = open(banned, "r")
    for line in file:
        words.append(line.rstrip("\n"))
    file.close()
    return True

if __name__ == "__main__":
    main()