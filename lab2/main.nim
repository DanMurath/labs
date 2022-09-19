import src/vendingMachine

var serNo: int = 999

proc serialNo(): int =
    serNo += 1
    result = serNo

proc main() =
    let crispV: VendingMachine = newVendingMachine(false, true, false, 10)
    let drinkV: VendingMachine = newVendingMachine(true, false, false, 8)
    let cookieV: VendingMachine = newVendingMachine(false, false, true, 8)
    let crispV2: VendingMachine = newVendingMachine(false, true, false, 8)

    let vends: array[0..3, VendingMachine] = [crispV, drinkV, cookieV, crispV2]

    crispV.switch(true)
    crispV.checkPwr()

    if crispV.on == true:
        echo "Item Stock: ", crispV.itemStock()
        crispV.buyItem(8)

        crispV.addItem(10)

        echo "Empty?: ", crispV.empty

        crispV.setLim(30) # programme exits if over max limit (50)
        crispV.addItem(27)
        echo crispV.itemStock()
        echo "VM-No    Item-Name    Quantity   Cost"
        for v in vends:
            stdout.write(serialNo(), "     ")
            v.tostring()
    else:
        echo "Machine is off. Use switch(bool) to turn on."

main()
