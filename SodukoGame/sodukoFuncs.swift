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

public enum Difficulty {
    case easy, medium, hard
}


public func isValid(grid: [[Int]], r: Int, c: Int)-> Bool {
    if r > DIM || c > DIM {
        return false
    }
    //check the vertical
    var counter = [Int](repeating: 0, count: 10)
    for i in 0..<DIM {
        if grid[i][c] != 0 {
            counter[grid[i][c] - 1] += 1
            if counter[grid[i][c] - 1] > 1 {
                return false
            }
        }
    }
    //check the horizontal
    counter = [Int](repeating: 0, count: 9)
    for i in 0..<DIM {
        if grid[r][i] != 0 {
            counter[grid[r][i] - 1] += 1
            if counter[grid[r][i] - 1] > 1 {
                return false
            }
        }
    }
    //check the sonnet
    counter = [Int](repeating: 0, count: 9)
    for i in 0..<DIM {
        let startY = start[r] + helperY[i]
        let startX = start[c] + helperX[i]
        if grid[startY][startX] != 0 {
            counter[grid[startY][startX] - 1] += 1
            if counter[grid[startY][startX] - 1] > 1 {
                return false
            }
        }
    }
    return true
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


public func printGrid(grid: [[Int]]) {
    for array in grid {
        for value in array {
            print(value, terminator: " ")
        }
        print(" ")
    }
}

public func createSoduko(difficulty: Difficulty)-> [[Int]] {
    var grid = fillGrid(times: 10)
    if solver(grid: &grid, r: 0, c: 0) {
        print("it was able to solve it ")
        var num: Int
        //remove values
        if difficulty == Difficulty.easy {
            num = 41
        } else if difficulty == Difficulty.medium  {
            num = 51
        } else {
            num = 56
        }
         
        for _ in 0..<num  { //removing numbers
            let r = Int.random(in: 0..<DIM)
            let c = Int.random(in: 0..<DIM)
            if grid[r][c] == 0 {
                continue
            } else {
                grid[r][c] = 0
            }
        }
    } else {
        print("recursion time ")
        return createSoduko(difficulty: difficulty)
    }
    return grid
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
