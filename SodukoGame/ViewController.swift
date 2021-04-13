//
//  ViewController.swift
//  SodukoGame
//
//  Created by Gianmarco Folchi on 4/5/21.
//
import UIKit

public var grid = Array(repeating: Array(repeating: 0, count: DIM), count: DIM)

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //generate and fill in the soduko
        fillSoduko(grid: createSoduko(difficulty: Difficulty.easy))
        
        
    }
    
    @IBOutlet var inOrderList: [UITextField]!
    
    

    
    @IBAction func actTest(_ sender: UITextField) {
        let r = sender.tag / 10
        let c = sender.tag % 10
        if let str = sender.text, let num = Int(str) {
            grid[r][c] = num
            print(num, r, c)
        }
    }
    
    func fillSoduko(grid: [[Int]]) {
        var i = 0
        var j = 0
        
        for box in inOrderList {
            if grid[i][j] != 0 {
            box.text = String(grid[i][j])
            }
            j += 1
            if j == DIM {
                i += 1
                j = 0
            }
            
        }
        
        
    }
    
}


