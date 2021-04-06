//
//  Grid.swift
//  SodukoGame
//
//  Created by Gianmarco Folchi on 4/5/21.
//

import UIKit

class Grid: UIView {
    // (0,0) at the upper left corner
    
    func drawGrid() {
        //draw the left line
//        let vertLine = UIBezierPath()
//        vertLine.move(to: .init(x: 50, y: 50))
//        vertLine.addLine(to: .init(x: 50, y: bounds.height - 50))
//        UIColor.black.setStroke()
//        vertLine.lineWidth = 3
//        vertLine.stroke()
//
//        //draw right line
//        let vertLine2 = UIBezierPath()
//        vertLine2.move(to: .init(x: bounds.maxX - 50, y: 50))
//        vertLine2.addLine(to: .init(x: bounds.maxX - 50, y: bounds.height - 50))
//        UIColor.black.setStroke()
//        vertLine2.lineWidth = 3
//        vertLine2.stroke()
//
        //draw horizontal line
        for i in 1..<11 {
            let test = CGFloat(i)
            let testLine = UIBezierPath()
            testLine.move(to: .init(x: bounds.maxX / 11, y: bounds.maxX / 11 * test))
            testLine.addLine(to: .init(x: bounds.maxX / 11 * 10, y: bounds.maxX/11 * test))
            if i == 1 || i == 4 || i == 7 || i == 10 {
                testLine.lineWidth = 4
            } else {
                testLine.lineWidth = 2
            }
            UIColor.black.setStroke()
            testLine.stroke()
        }
        //draw vertical line
        for i in 1..<11 {
            let test = CGFloat(i)
            let testLine1 = UIBezierPath()
            testLine1.move(to: .init(x: bounds.maxX / 11 * test, y: bounds.maxX / 11))
            testLine1.addLine(to: .init(x: bounds.maxX / 11 * test, y: bounds.maxX / 11 * 10))
            if i == 1 || i == 4 || i == 7 || i == 10 {
                testLine1.lineWidth = 4
            } else {
                testLine1.lineWidth = 2
            }
            UIColor.black.setStroke()
            testLine1.stroke()
        }
    }
    
    override func draw(_ rect: CGRect) {
        drawGrid()
        // Drawing code
    }
    
    
}
