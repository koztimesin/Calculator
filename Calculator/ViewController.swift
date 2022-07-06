//
//  ViewController.swift
//  Calculator
//
//  Created by Karthus Saffron on 7/5/22.
//  Copyright © 2022 koztimesin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum Operations: String {
        case plus = "+"
        case minus = "-"
        case multiply = "*"
        case divide = "/"
        case percentage = "%"
        case NULL = "Null"
    }
    
    @IBOutlet var outputLabel: UILabel!
    
    var currentNum = "0"
    var leftNum = ""
    var rightNum = ""
    var result = ""
    var currentOperation:Operations = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
    }

    @IBAction func numbersButton(_ sender: RoundButton) {
        if sender.tag == 0 && outputLabel.text == "0" { return }
        if currentNum.count <= 8 {
            if currentNum == "0" { currentNum = "" }
            currentNum += "\(sender.tag)"
            outputLabel.text = currentNum
        }
    }
    
    @IBAction func allClear(_ sender: RoundButton) {
        currentNum = "0"
        leftNum = ""
        rightNum = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0"
    }
    @IBAction func plusMinus(_ sender: RoundButton) {
    }
    @IBAction func percentNum(_ sender: RoundButton) {
    }
    @IBAction func divideNum(_ sender: RoundButton) {
        operation(operations: .divide)
    }
    @IBAction func multiplyNum(_ sender: RoundButton) {
        operation(operations: .multiply)
    }
    @IBAction func subtractNum(_ sender: RoundButton) {
        operation(operations: .minus)
    }
    @IBAction func plusNum(_ sender: RoundButton) {
        operation(operations: .plus)
    }
    @IBAction func dotNum(_ sender: RoundButton) {
        if currentNum.filter({$0 == "."}).count != 1 {
            if currentNum.count <= 7 {
                currentNum += "."
                outputLabel.text = currentNum
            }
        }
    }
    @IBAction func resultNum(_ sender: RoundButton) {
        operation(operations: currentOperation)
    }
    
    func operation(operations: Operations)
    {
        if currentOperation != .NULL {
            if currentNum != "" {
                rightNum = currentNum
                currentNum = ""
                switch currentOperation {
                case .plus:
                    result = String(format: "%.2f", (Double(leftNum)! + Double(rightNum)!))
                case .minus:
                    result = String(format: "%.2f", (Double(leftNum)! - Double(rightNum)!))
                case .multiply:
                    result = String(format: "%.2f", (Double(leftNum)! * Double(rightNum)!))
                case .divide:
                    result = String(format: "%.2f", (Double(leftNum)! + Double(rightNum)!))
                default:
                    return
                }
                leftNum = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                } else {
                    result = "\(Double(result)!)"
                }
                outputLabel.text = result
            }
            currentOperation = operations
        } else {
            leftNum = currentNum
            currentNum = ""
            currentOperation = operations
        }
    }
}

