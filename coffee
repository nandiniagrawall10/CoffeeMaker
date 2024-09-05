MENU= {
    "espresso":{
        "ingrediants":{
            "water":15,
            "milk":18,
        },
    "cost":1.5,
    },
    "latte":{
        "ingrediants":{
            "water":200,
            "milk":150,
            "coffee":24,
        },
        "cost":2.5,
    },
    "capuccino":{
        "ingrediants":{
            "water":250,
            "milk":100,
            "coffee":24,
        },
        "cost":3.0,
    }
}
profit=0
resources = {
    "water":300,
    "milk": 200,
    "coffee":100,
}


def is_resources_sufficient(order_ingrediants):
    for item in order_ingrediants:
        if order_ingrediants[item]>=resources[item]:
            print(f"Sorry, there is not enough {item}")
            return False
    return True

def process_coins():
    print("please insert coins:")
    total=int(input("How many quarters?"))*0.25
    total+=int(input("How many dimes?"))*0.1
    total+=int(input("How many nickels?"))*0.05
    total+=int(input("How many penny?"))*0.01
    return total

def is_transaction_successful(money_recieved, drink_cost):
    if money_recieved>=drink_cost:
        change=round(money_recieved-drink_cost,2)
        print(f"Here is the change {change}")
        global profit
        profit+=drink_cost
        return True
    else:
        print("Sorry not enough money, money refunded")
        return False

def make_coffee(drink_name, order_ingrediants):
    for item in order_ingrediants:
        resources[item]-=order_ingrediants[item]
    print("Here is your coffee, enjoy")

is_on=True
while is_on:
    choice=input("What would you like?(espresso/capuccino/latte?):\n")
    #print(f"Water: {resources['water']} ml \nMilk: {resources['milk']} ml \nCoffee: {resources['coffee']} g")
    if choice=="off":
        is_on=False
    elif choice=="report":
        print(f"Water: {resources['water']}ml")
        print(f"Milk: {resources['milk']}ml")
        print(f"Coffee: {resources['coffee']}g")
    else:
        drink = MENU[choice]
        if is_resources_sufficient(drink["ingrediants"]):
           payment = process_coins()
           if is_transaction_successful(payment, drink["cost"]):
                make_coffee(choice, drink["ingrediants"])
            
