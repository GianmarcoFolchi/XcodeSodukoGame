//
//  ViewController.swift
//  SodukoGame
//
//  Created by Gianmarco Folchi on 4/5/21.
//
import UIKit

class ViewController: UIViewController {
    public var grid = Array(repeating: Array(repeating: 0, count: DIM), count: DIM)
    var difficulty: Difficulty = .easy
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet var inOrderList: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //generate and fill in the soduko
        grid = createSoduko(difficulty: difficulty)
        fillSoduko(grid: grid)
    }
    
    @IBAction func actTest(_ sender: UITextField) {
        let r = sender.tag / 10
        let c = sender.tag % 10
        if sender.text == "" {
            grid[r][c] = 0
        }
        if let str = sender.text, let num = Int(str) {
            grid[r][c] = num
            print(num, r, c)
        }
    }
    
    @IBAction func checkValidity(_ sender: Any) {
        testLabel.text = String(fullSodukoIsValid(grid: grid))
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


