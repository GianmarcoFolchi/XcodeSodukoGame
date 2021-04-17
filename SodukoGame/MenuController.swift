//
//  MenuController.swift
//  SodukoGame
//
//  Created by Gianmarco Folchi on 4/14/21.
//

import UIKit

class MenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var difficulty: Difficulty = .easy
    
    @IBAction func easyButton(_ sender: Any) {
        difficulty = .easy
    }
    
    @IBAction func mediumButton(_ sender: Any) {
        difficulty = .medium
    }
    
    @IBAction func hardButton(_ sender: Any) {
        difficulty = .hard
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //go to the start game seague and pass in the value of diff
        if segue.identifier == "startGame" {
            let controller = segue.destination as! ViewController
            controller.difficulty = difficulty
        }
    }
}
