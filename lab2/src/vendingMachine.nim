# important note:
# nim classes only supports var, method and mixins. Simple.
# currently no way to create static methods/variables inside a class
# and can only be done outside. vars in class can only be mutable.

# all methods:
# switch(bool) checkPwr() viewItemType(): string,
# viewItemCst(): float, itemStock(): int, addItem(), buyItem()
# restockWarn() and tostring()
# buy item invokes effects from restockWarn.
# Though not called in elif, as we called itemStock()
# which itself calls restockWarn() if needed. doing the job for us

import classes

class VendingMachine:
    var
        on: bool
        drink: bool
        crisp: bool
        cookie: bool
        itemAmnt: int
        itmLim: int
        empty: bool
        itemCst: float
        x: int
        serialNo: int = 1000

    method init(drink: bool, crisp: bool, cookie: bool, itemAmnt: int) =
        this.drink = drink
        this.crisp = crisp
        this.cookie = cookie
        this.itemAmnt = itemAmnt

        if this.itemAmnt == 0:
            this.empty = true

    method setLim(itmLim: int) =
        let truItmLim: int = 50
        this.itmLim = itmLim
        if this.itmLim > truItmLim:
            raise newException(ValueError, "Too many items!")

    method switch(on: bool) =
        this.on = on

    method checkPwr() =
        if this.on:
            echo "machine on"
        else:
            echo "machine off"

    method viewItemType(): string =
        var itm: string
        if this.drink:
            itm = "Drinks"
            # echo "Drinks vending machine"
        elif this.crisp:
            itm = "Crisps"
            # echo "Crisps vending machine"
        elif this.cookie:
            itm = "Cookies"
            # echo "Cookie vending machine"
        else:
            this.empty = true
            echo "Out of service"
            itm = "Empty"

        result = itm

    method viewItemCst(): float =
        if this.drink:
            this.itemCst = 1.50
            # echo "Drink cost: ", this.itemCst
        elif this.crisp:
            this.itemCst = 0.90
            # echo "Crisp cost: ", this.itemCst
        elif this.cookie:
            this.itemCst = 1.20
            # echo "Cookie cost: ", this.itemCst
        else:
            echo "Out of service"

        result = this.itemCst

    method itemStock(): int =
        if this.itemAmnt <= 0:
            this.empty = true
            this.restockWarn()
        else:
            this.empty = false
            this.restockWarn()

        result = this.itemAmnt

    method addItem(it: int) =
        if this.itemAmnt + it <= this.itmLim:
            this.itemAmnt += it
            this.empty = false
            echo this.itemAmnt, " Items added."
        else:
            echo "max amount of items exceeded"

    method buyItem(buy: int) =
        if this.empty:
            this.restockWarn()
        elif this.itemStock() - buy < 0:
            echo "Insufficient amount of items. Select a lower amount."
        else: # restockWarn will run if items are 2 or less
            this.itemAmnt -= buy
            echo buy, " Items bought. Thank you."
            if this.itemStock() - buy == 0: # prints no items msg as we use itemStock() method
                this.empty = true

    method restockWarn() =
        if this.itemAmnt < 3 and this.itemAmnt > 0:
            echo this.itemAmnt, " items remaining. Please restock!"
        elif this.itemAmnt <= 0:
            echo "No items remaining. Please restock!"

    method tostring() =
        echo this.viewItemType(), "         ", this.itemAmnt, "        £", this.viewItemCst()
