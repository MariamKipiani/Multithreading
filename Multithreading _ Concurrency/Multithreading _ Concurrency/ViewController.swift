//
//  ViewController.swift
//  Multithreading _ Concurrency
//
//  Created by user on 11/9/23.
//

import UIKit

import Foundation

func generateRandomNumbers() -> (Int, Int) {
    let lowerBound = 20
    let upperBound = 50
    let firstNumber = Int.random(in: lowerBound...upperBound)
    let secondNumber = Int.random(in: lowerBound...upperBound)
    return (firstNumber, secondNumber)
}

func factorial(_ number: Int) -> Int {
    if number == 0 {
        return 1
    }
    return number * factorial(number - 1)
}

func main() {
    let (firstNumber, secondNumber) = generateRandomNumbers()
    
    let dispatchGroup = DispatchGroup()
    
    var winnerThread: String?
    
    DispatchQueue.global().async(group: dispatchGroup) {
        let firstFactorial = factorial(firstNumber)
        print("First number: \(firstNumber), Factorial: \(firstFactorial)")
        winnerThread = "Thread 1"
    }
    
    DispatchQueue.global().async(group: dispatchGroup) {
        let secondFactorial = factorial(secondNumber)
        print("Second number: \(secondNumber), Factorial: \(secondFactorial)")
        winnerThread = "Thread 2"
    }
    
    dispatchGroup.wait()
    
    print("\(winnerThread ?? "No winner thread") wins!")
}






