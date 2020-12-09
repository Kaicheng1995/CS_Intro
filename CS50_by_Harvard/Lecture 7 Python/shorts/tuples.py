
presidents = [
    ("George Washington",1789),
    ("John Adams",1798),
    ("Tomas Jefferson",1801),
    ("James Madison",1809)]

for name,year in presidents:
    print("In {1}, {0}took office".format(name,year))

#format 作用是提取tuples的内容格式