#!/usr/bin/env swift

/*
 A simple implementation of the selection sorting
 algorithm to sort integers from greatest to least
 */

extension String {
    var isInt: Bool {
        Int(self) != nil
    }
}

func sort(arr: [Int], order: Int) -> [Int] {
    /*
     Order the given array from least to greatest if
     order is 0, or from greatest to least if order is 1
     */
    var sortedArr = arr

    if order == 0 {
        for idx in 0 ..< sortedArr.count {
            var maxIdx = idx

            for jdx in (idx + 1) ..< sortedArr.count where sortedArr[maxIdx] < sortedArr[jdx] {
                maxIdx = jdx
            }

            let temp = sortedArr[idx]
            sortedArr[idx] = sortedArr[maxIdx]
            sortedArr[maxIdx] = temp
        }
    } else if order == 1 {
        for idx in 0 ..< sortedArr.count {
            var minIdx = idx

            for jdx in (idx + 1) ..< sortedArr.count where sortedArr[minIdx] > sortedArr[jdx] {
                minIdx = jdx
            }

            let temp = sortedArr[idx]
            sortedArr[idx] = sortedArr[minIdx]
            sortedArr[minIdx] = temp
        }
    } else {
        print("Invalid Order. Cannot sort the array")
    }

    return sortedArr
}

var nums: [Int] = []

// Set to 0 for least to greatest, or set it to 1 for greatest to least
let order = 0

while true {
    print("-> ", terminator: "")
    let value = readLine(strippingNewline: true)

    if value == "done" || value == "break" {
        break
    } else if value!.isInt { // uses the isInt extension to determine if the value can be converted to int
        nums.append(Int(value!)!)
    } else {
        print("Invalid input")
    }
}

print(sort(arr: nums, order: order))
