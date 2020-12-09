
#"cheese" is key, 9 is value.
pizzas = {
    "cheese":9,
    "pepperoni":10,
    "vegetable":11,
    "buffalo chicken":12
}


#1 change value
pizzas["cheese"] = 8

#2 add new value
pizzas["bacon"] = 13

#3 iterate the key
for pie in pizzas:
    print(pie)

#4 iterate the value
for pie,price in pizzas.items():
    print(price)

#5 printing variables
#(only string can be concatenated)
for pie,price in pizzas.items():
    print("A whole {} pizza costs ${}".format(pie,price))
    print("A whole" + pie + "pizza costs $" + str(price))