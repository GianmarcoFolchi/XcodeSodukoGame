//
//  sodukoFuncs.swift
//  SodukoGame
//
//  Created by Gianmarco Folchi on 4/5/21.
//

import Foundation

public let DIM = 9
let helperY = [0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3]
let helperX = [0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2]
let start = [0, 0, 0, 3, 3, 3, 6, 6, 6]
let sqrtDIM = 3

public enum Difficulty {
    case easy, medium, hard
}

public func solver(grid: inout [[Int]], r: Int, c: Int)-> Bool {
    var nR = r
    var nC = c
    if nC == DIM {
        nR = nR + 1
        nC = 0
    }
    if nR == DIM {
        return true
    }
    if grid[nR][nC] == 0 {
        for i in 1..<DIM + 1 {
            grid[nR][nC] = i
            if isValid(grid: grid, r: nR, c: nC) {
                if solver(grid: &grid, r: nR, c: nC + 1) {
                    return true
                }
            }
            grid[nR][nC] = 0
        }
    } else {
        if isValid(grid: grid, r: nR, c: nC) {
            return solver(grid: &grid, r: nR, c: nC + 1)
        }
    }
    return false
}

public func createSoduko(difficulty: Difficulty)-> [[Int]] {
    var grid = fillGrid(times: 10)
    var num: Int
    if solver(grid: &grid, r: 0, c: 0) { //backtracking right here
        switch difficulty {
        case .easy:
            num = 41
        case .medium:
            num = 51
        default:
            num = 56
        }
        for _ in 0..<num  { //removing random numbers based on the chosen difficulty
            let r = Int.random(in: 0..<DIM)
            let c = Int.random(in: 0..<DIM)
            grid[r][c] = 0
        }
        return grid
    } else {
        print("recursion")
        //call the function again and return that value
        return createSoduko(difficulty: difficulty)
    }
}

public func fillGrid(times: Int)-> [[Int]] {
    var grid = Array(repeating: Array(repeating: 0, count: DIM), count: DIM)
    //fill in the grid with 10 random numbers
    for _ in 0..<times{
        let r = Int.random(in: 0..<DIM)
        let c = Int.random(in: 0..<DIM)
        let num = Int.random(in: 1..<10)
        if grid[r][c] == 0 {
            grid[r][c] = num
        } else {
            continue
        }
    }
    return grid
}

public func printGrid(grid: [[Int]]) {
    for array in grid {
        for value in array {
            print(value, terminator: " ")
        }
        print(" ")
    }
}
