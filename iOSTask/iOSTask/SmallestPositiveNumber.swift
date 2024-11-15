//
//  SmallestPositiveNumber.swift
//  iOSTask
//
//  Created by Adel Aref on 15/11/2024.
//


func missingNumber(_ arr: inout [Int], _ n: Int) -> Int {
    // Step 1: Segregate positive and non-positive numbers
    var j = 0
    for i in 0..<n {
        if arr[i] <= 0 {
            arr.swapAt(i, j)
            j += 1
        }
    }

    // Step 2: Mark the presence of numbers in the positive part
    for i in j..<n {
        let val = abs(arr[i])
        if val - 1 < n - j && arr[j + val - 1] > 0 {
            arr[j + val - 1] = -arr[j + val - 1]
        }
    }

    // Step 3: Find the first positive index
    for i in j..<n {
        if arr[i] > 0 {
            return i - j + 1
        }
    }

    // If all indices are marked, return the next positive number
    return n - j + 1
}


