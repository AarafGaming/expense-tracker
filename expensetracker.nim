import std/strutils
import times
var expensesitems: seq[string] = @[]
var expensescosts: seq[int] = @[]
var expensesdescriptions: seq[string] = @[]
var expensestimes: seq[string] = @[]
var total = 0
var itemCost = 0

stdout.write("Enter currency: ")
var currency = readLine(stdin)
while true:
    stdout.write("\x1b[H\x1b[2J")
    echo "Pick one:"
    echo " 1: Add a bought item"
    echo " 2: Display Expenses"
    echo " 3: Add a sold item"
    echo " 4: Exit"
    stdout.write("Choose: ")
    var chosen_option = readLine(stdin)
    if chosen_option == "1":
        stdout.write("\x1b[H\x1b[2J")
        stdout.write("Enter item name: ")
        expensesitems.add(readLine(stdin))
        stdout.write("Enter item cost: ")
        expensescosts.add(abs(parseInt(readLine(stdin))))
        stdout.write("Enter item description: ")
        expensesdescriptions.add(readLine(stdin))
        expensestimes.add(now().format("hh:mm tt"))
        echo "Added successfully"
    
    elif chosen_option == "2":
        stdout.write("\x1b[H\x1b[2J")
        total = 0
        for i in 0 ..< expensesitems.len:
            itemCost = expensescosts[i]
            if itemCost < 0:
                echo "[", expensestimes[i], "] ", expensesitems[i], " sold for ", abs(itemCost), " ", currency
            else:
                echo "[", expensestimes[i], "] ", expensesitems[i], " costs ", itemCost, " ", currency, ". Description: ", expensesdescriptions[i]
            total += itemCost

        echo "Total: ", total, " ", currency
        discard readLine(stdin)

    elif chosen_option == "3":
        stdout.write("\x1b[H\x1b[2J")
        stdout.write("Enter item name: ")
        expensesitems.add(readLine(stdin))
        stdout.write("Enter item sell price: ")
        expensescosts.add((abs(parseInt(readLine(stdin))) * -1))
        expensestimes.add(now().format("hh:mm tt"))
        echo "Added successfully"

    elif chosen_option == "4":
        quit(0)
        
     