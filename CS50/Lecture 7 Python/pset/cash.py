from cs50 import get_float

while True:
    n = get_float("Change owed:""\n")
    cent = round(100 * n)
    if n > 0:
        break

quarters = cent // 25
dimes = (cent % 25) // 10
nickles = ((cent % 25) % 10) // 5
pennies = ((cent % 25) % 10) % 5

coin = quarters + dimes + nickles + pennies
print(coin)

