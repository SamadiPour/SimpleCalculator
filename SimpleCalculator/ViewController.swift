//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Amir Hossein on 2/9/19.
//  Copyright © 2019 Amir Hossein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*----------------------Labels----------------------*/
    @IBOutlet weak var inputLable: UILabel!
    @IBOutlet weak var resultLable: UILabel!
    
    
    
    /*----------------------operator enum----------------------*/
    enum Operators : String {
        case plus = "+"
        case minus = "-"
        case divide = "/"
        case multiply = "*"
    }
    
    
    
    /*----------------------Variables----------------------*/
    var numbersArray : [Double] = [0]
    var numbersStringArray : [String] = ["0"]
    var operatorsArray : [Operators] = []
    var inputText : String = "0"
    var numberExist : Bool = false
    var pointExist : Bool = false
    var operatorExist : Bool = false
    
    
    
    /*----------------------Main Function----------------------*/
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    /*----------------------Main Operations!----------------------*/
    @IBAction func clearAll(_ sender: UIButton) {
        inputLable.text?.removeAll(); inputLable.text = "0"
        resultLable.text?.removeAll()
        numbersArray.removeAll(); numbersArray = [0]
        operatorsArray.removeAll(); operatorsArray = []
        inputText = "0"
        numberExist = false; pointExist = false; operatorExist = false
    }
    
    @IBAction func calculateBtn(_ sender: UIButton) {
        
    }
    
    
    
    /*----------------------Operators----------------------*/
    @IBAction func mainMathOperators(_ sender: UIButton) {
        //check if op exist
        if operatorExist {
            //we are going to replace last 3 chars
            inputText = String(inputText.dropLast(3))
            operatorsArray.removeLast()
        } else {
            operatorExist = true
            numbersStringArray.append("")
        }
        
        //reset variables
        numberExist = false
        pointExist = false
        
        
        //get number that clicked
        guard let inputString : String = sender.titleLabel?.text else {return}
        
        //modify input
        inputText += " " + inputString + " "
        
        //set lable with new input
        inputLable.text = inputText
        
        //find operator and add it to array
        guard let ops : Operators = Operators.init(rawValue: inputString) else {return}
        operatorsArray.append(ops)
    }
    
    @IBAction func signBtn(_ sender: Any) {
    }
    
    @IBAction func percentBtn(_ sender: UIButton) {
        
    }
    
    
    
    /*----------------------Numbers And Point----------------------*/
    @IBAction func digitButtons(_ sender: UIButton) {
        //get number that clicked
        guard let inputString : String = sender.titleLabel?.text else {return}
        
        //check if it is a point
        if inputString == "." {
            if pointExist {
                return
            } else {
                pointExist = true
            }
        }
        
        //pop last number to modify it
        guard let numberString : String = numbersStringArray.removeLast() else {return}
        if numberExist {
            numbersArray.removeLast()
        }
        
        //modify number based on input
        let newNumberString : String
        if inputText == "0" && inputString != "." {
            newNumberString = inputString
            numbersArray.removeFirst()
        } else {
            newNumberString = numberString + inputString
        }
        
        //push back new value
        numbersStringArray.append(newNumberString)
        numbersArray.append(Double(newNumberString)!)
        
        //change input based on new number
        inputText = inputText.prefix(inputText.count - numberString.count) + newNumberString
        print(numberString, ":", inputText)
        
        //re calculate whole input
        operatorExist = false
        numberExist = true
        reCalculate()
    }
    
    func reCalculate(){
        //set lable with new input
        inputLable.text = inputText
        
        //if we have 2 number in our list and we are sure that next number is entered then calculate result
        if (numbersArray.count) > 1 && numberExist {
            
            //clone arrays to calculate
            var numbersArrayTemp : [Double] = numbersArray
            var operatorsArrayTemp : [Operators] = operatorsArray
            
            //search for * and / from left
            var index : Int = 0
            while (!operatorsArrayTemp.isEmpty && index < operatorsArrayTemp.count){
                if operatorsArrayTemp[index] == .multiply || operatorsArrayTemp[index] == .divide {
                    
                    //get number and operators from left
                    let currentOP : Operators = operatorsArrayTemp.remove(at: index)
                    let num1 : Double = numbersArrayTemp.remove(at: index)
                    let num2 : Double = numbersArrayTemp.remove(at: index)
                    let result : Double
                    
                    //lets calculate result
                    switch currentOP {
                    case .multiply : result = num1 * num2
                    case .divide : result = num1 / num2
                    default: return
                    }
                    
                    //push back result
                    numbersArrayTemp.insert(result, at: index)
                    index -= 1
                }
                index += 1
            }
            
            //search for + and - from left
            index = 0
            while (!operatorsArrayTemp.isEmpty && index < operatorsArrayTemp.count){
                if operatorsArrayTemp[index] == .plus || operatorsArrayTemp[index] == .minus {

                    //get number and operators from left
                    let currentOP : Operators = operatorsArrayTemp.remove(at: index)
                    let num1 : Double = numbersArrayTemp.remove(at: index)
                    let num2 : Double = numbersArrayTemp.remove(at: index)
                    let result : Double

                    //lets calculate result
                    switch currentOP {
                    case .minus : result = num1 - num2
                    case .plus : result = num1 + num2
                    default: return
                    }

                    //push back result
                    numbersArrayTemp.insert(result, at: index)
                    index -= 1
                }
                index += 1
            }
            
            //set result
            resultLable.text = String(numbersArrayTemp.removeFirst())
            
        }
        
    }
    
}
