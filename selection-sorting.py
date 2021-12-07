#!/usr/bin/env python3

"""
# A simple implimentation of the selection sorting algorithm to sort
# integers either from least to greatest, or greatest to least
"""


def sort(array, order):
    """
    Order the given array from least to greatest if
    order is 0, or from greatest to least if order is 1
    """
    if order == 0:
        for i in range(len(array)):
            max_index = i
            for j in range(i + 1, len(array)):
                if array[max_index] < array[j]:
                    max_index = j

            array[i], array[max_index] = array[max_index], array[i]

    elif order == 1:
        for i in range(len(array)):
            min_index = i
            for j in range(i + 1, len(array)):
                if array[min_index] > array[j]:
                    min_index = j

            array[i], array[min_index] = array[min_index], array[i]

    else:
        print("Invalid Order. Cannot sort the array")

    return array


if __name__ == "__main__":
    nums = []

    # Set to 0 for least to greatest, or set it to 1 for greatest to least
    order = 0

    while True:
        value = input("-> ")

        if value == "done" or value == "break":
            break

        else:
            try:
                nums.append(int(value))
            except ValueError:
                print("Invalid input")

    print(sort(nums, order))
