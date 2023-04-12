while True:
    decision = input("Type add, show, edit, completed, or done: ")
    decision = decision.strip()

    if "add" in decision:
        item = decision[4:]

        with open('total.txt', 'r') as file:
            total = file.readlines()

        total.append(item)

        with open('total.txt', 'w') as file:
            file.writelines(total)

    elif "show" in decision:

        with open('total.txt', 'r') as file:
            total = file.readlines()

        for index, element in enumerate(total):
            element = element.strip("\n")
            index = index + 1
            row = f"{index}-{element}"
            print(row)
    elif "edit" in decision:
        i = int(decision[5:])
        print(i)
        i = i - 1

        with open('total.txt', 'r') as file:
            total = file.readlines()

        new_item = input("Please enter the replacement item... ")
        total[i] = new_item + "\n"

        with open('total.txt', 'w') as file:
            file.writelines(total)

    elif "completed" in decision:
        item = int(decision[10:])

        with open('total.txt', 'r') as file:
            total = file.readlines()

        index = item - 1
        item_to_be_removed = total[index].strip("\n")
        total.pop(index)

        with open('total.txt', 'w') as file:
            file.writelines(total)

        message = f"The item '{item_to_be_removed}' was removed from the list!"
        print(message)

    elif "done" in decision:
        break
    else:
        print("You didn't follow directions. Let's try that again.")

print("Hear is the to-do list: ")
