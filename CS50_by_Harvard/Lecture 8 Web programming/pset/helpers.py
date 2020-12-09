# the library to distract sentences
from nltk.tokenize import sent_tokenize

def lines(a, b):
    """Return lines in both a and b"""
    line_a = set(a.splitlines())
    line_b = set(b.splitlines())
    return line_a & line_b

def sentences(a, b):
    """Return sentences in both a and b"""
    sent_a = set(sent_tokenize(a))
    sent_b = set(sent_tokenize(b))
    return sent_a & sent_b

def substring_tokenize(string, n):
    substrings = []
    for i in range(len(string) - n + 1):
        substrings.append(string[i:i + n])
    return substrings

def substrings(a, b, n):
    """Return substrings of length n in both a and b"""
    subs_a = set(substring_tokenize(a,n))
    subs_b = set(substring_tokenize(b,n))
    return subs_a & subs_b

# how to use list to solve this?
