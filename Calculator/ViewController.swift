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
    
    var currentNum = ""
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
            currentNum += "\(sender.tag)"
            outputLabel.text = currentNum
        }
    }
    
    @IBAction func allClear(_ sender: RoundButton) {
        currentNum = ""
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
                if currentOperation == .plus {
                    result = "\(Double(leftNum)! + Double(rightNum)!)"
                }
                else if currentOperation == .minus {
                    result = "\(Double(leftNum)! - Double(rightNum)!)"
                }
                else if currentOperation == .multiply {
                    result = "\(Double(leftNum)! * Double(rightNum)!)"
                }
                else if currentOperation == .divide {
                    result = "\(Double(leftNum)! / Double(rightNum)!)"
                }
                else if currentOperation == .percentage {
                }
                leftNum = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
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

