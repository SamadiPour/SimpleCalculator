//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Amir Hossein & Alireza.Az on 2/9/19.
//  Copyright © 2019 Alireza.Az and Amir Hossein All rights reserved.
//

import UIKit

extension Double {
    // Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
        
    }
}


class ViewController: UIViewController {

    /*----------------------UI----------------------*/
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var firstRowStack: UIStackView!
    @IBOutlet weak var secondRowStack: UIStackView!
    @IBOutlet weak var thirdRowStack: UIStackView!
    @IBOutlet weak var fourthRowStack: UIStackView!
    @IBOutlet weak var fifthRowStack: UIStackView!
    @IBOutlet weak var numpadStack: UIStackView!
    @IBOutlet weak var topStack: UIStackView!
    @IBOutlet weak var theRedLine: UIProgressView!
    
    
    /*----------------------operator enum----------------------*/
    enum Operators : String {
        case plus = "+"
        case minus = "-"
        case divide = "/"
        case multiply = "*"
    }
    
    
    /*----------------------Variables----------------------*/
    fileprivate func setupLayout (){
        
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.distribution = .fillEqually
        topStack.axis = .vertical
        
        NSLayoutConstraint.activate([
            topStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            topStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            topStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            topStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            topStack.bottomAnchor.constraint(equalTo: theRedLine.topAnchor , constant: -10),
//            topStack.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.3)
            topStack.heightAnchor.constraint(lessThanOrEqualToConstant: 50)
            ])
        
        
        
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputTextView.leadingAnchor.constraint(equalTo: topStack.leadingAnchor),
//            inputTextView.trailingAnchor.constraint(equalTo: topStack.trailingAnchor, constant: -25),
            inputTextView.widthAnchor.constraint(equalTo: topStack.widthAnchor),
//            inputTextView.heightAnchor.constraint(lessThanOrEqualToConstant: 25)
            ])
        
        
        
        resultLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLable.leadingAnchor.constraint(equalTo: topStack.leadingAnchor),
//            resultLable.trailingAnchor.constraint(equalTo: topStack.trailingAnchor, constant: -25),
            resultLable.widthAnchor.constraint(equalTo: topStack.widthAnchor),
//            inputTextView.heightAnchor.constraint(lessThanOrEqualToConstant: 25)
            ])
        
        
        
        theRedLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            theRedLine.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 10),
            theRedLine.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -10),
            theRedLine.bottomAnchor.constraint(equalTo: numpadStack.topAnchor, constant: -10)
            ])
        
        
        
        numpadStack.translatesAutoresizingMaskIntoConstraints = false
        numpadStack.distribution = .fillEqually
        numpadStack.axis = .vertical
        
        NSLayoutConstraint.activate([
            numpadStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            numpadStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            numpadStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numpadStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            numpadStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            ])
        
        
        
        firstRowStack.translatesAutoresizingMaskIntoConstraints = false
        firstRowStack.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            firstRowStack.leadingAnchor.constraint(equalTo: numpadStack.leadingAnchor),
            firstRowStack.trailingAnchor.constraint(equalTo: numpadStack.trailingAnchor),
            firstRowStack.widthAnchor.constraint(equalTo: numpadStack.widthAnchor)
            ])
        
        
        
        secondRowStack.translatesAutoresizingMaskIntoConstraints = false
        secondRowStack.distribution = .fillEqually

        NSLayoutConstraint.activate([
            secondRowStack.leadingAnchor.constraint(equalTo: numpadStack.leadingAnchor),
            secondRowStack.trailingAnchor.constraint(equalTo: numpadStack.trailingAnchor),
            secondRowStack.widthAnchor.constraint(equalTo: numpadStack.widthAnchor)
            ])



        thirdRowStack.translatesAutoresizingMaskIntoConstraints = false
        thirdRowStack.distribution = .fillEqually

        NSLayoutConstraint.activate([
            thirdRowStack.leadingAnchor.constraint(equalTo: numpadStack.leadingAnchor),
            thirdRowStack.trailingAnchor.constraint(equalTo: numpadStack.trailingAnchor),
            thirdRowStack.widthAnchor.constraint(equalTo: numpadStack.widthAnchor)
            ])

        

        fourthRowStack.translatesAutoresizingMaskIntoConstraints = false
        fourthRowStack.distribution = .fillEqually

        NSLayoutConstraint.activate([
            fourthRowStack.leadingAnchor.constraint(equalTo: numpadStack.leadingAnchor),
            fourthRowStack.trailingAnchor.constraint(equalTo: numpadStack.trailingAnchor),
            fourthRowStack.widthAnchor.constraint(equalTo: numpadStack.widthAnchor)
            ])

        
        
        fifthRowStack.translatesAutoresizingMaskIntoConstraints = false
        fifthRowStack.distribution = .fillEqually

        NSLayoutConstraint.activate([
            fifthRowStack.leadingAnchor.constraint(equalTo: numpadStack.leadingAnchor),
            fifthRowStack.trailingAnchor.constraint(equalTo: numpadStack.trailingAnchor),
            fifthRowStack.widthAnchor.constraint(equalTo: numpadStack.widthAnchor)
            ])
        
    }
    
    
    
    /*----------------------Variables----------------------*/
    var numbersArray : [(num : Double, sign : Bool)] = [(0,true)]
    var numbersStringArray : [String] = ["0"]
    var operatorsArray : [Operators] = []
    var inputText : String = "0"
    var numberExist : Bool = false
    var pointExist : Bool = false
    var operatorExist : Bool = false
    var currentSign : Bool = true
    var percentExist : Bool = false
    
    
    
    /*----------------------Main Function----------------------*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        inputTextView.textContainer.maximumNumberOfLines = 1
        inputTextView.invalidateIntrinsicContentSize()
        inputTextView.textContainer.lineBreakMode = .byTruncatingHead
        inputTextView.isScrollEnabled = true
        
    }
    
    
    
    /*----------------------Main Operations!----------------------*/
    @IBAction func clearAll(_ sender: UIButton) {
        inputTextView.text = "0"
        resultLable.text?.removeAll()
        numbersArray = [(0,true)]
        operatorsArray = []
        numbersStringArray = ["0"]
        inputText = "0"
        numberExist = false
        pointExist = false
        operatorExist = false
        currentSign = true
        percentExist = false
    }
    
    @IBAction func calculateBtn(_ sender: UIButton) {
        //if the last entered was operator and there wasn't any number after that
        if (operatorExist && !numberExist){
            operatorsArray.removeLast()
            reCalculate()
        }
        
        // if we have only one number
        if (numbersArray.count < 2){
            return
        }
        
        //show the last calculated result a the last result :D
        let result : String = resultLable.text ?? "0"
        
        //remove and clear
        resultLable.text?.removeAll()
        numbersArray = []
        operatorsArray = []
        numbersStringArray = []
        
        //set input with result
        inputText = result
        inputTextView.text = result
        
        //add result as input to elements
        let number : Double = Double(result)!
        currentSign = number >= 0
        numberExist = true
        numbersArray.append((num: abs(number), sign: currentSign))
        let numbersString : String = currentSign ? result : "(-" + result.dropFirst()
        pointExist = numbersString.contains(".")
        numbersStringArray.append(numbersString)
    }
    
    
    
    /*----------------------Operators----------------------*/
    @IBAction func mainMathOperators(_ sender: UIButton) {
        //don't put operator after negetive sign without number
        if !numberExist && !currentSign {
            return
        }
        
        //put ")" when number is negetive
        if !currentSign {
            inputText += ")"
        }
        
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
        currentSign = true
        percentExist = false
        
        //get number that clicked
        guard let inputString : String = sender.titleLabel?.text else {return}
        
        //modify input
        inputText += " " + inputString + " "
        
        //set lable with new input
        inputTextView.text = inputText
        
        //find operator and add it to array
        guard let ops : Operators = Operators.init(rawValue: inputString) else {return}
        operatorsArray.append(ops)
    }
    
    @IBAction func signBtn(_ sender: Any) {
        //if number didn't exist so we should add "(-" to label
        if !numberExist {
            if currentSign {
                if inputText == "0" {
                    inputText = ""
                }
                inputText += "(-"
            } else {
                inputText = String(inputText.prefix(inputText.count - 2))
            }
        } else {
            guard let numberString = numbersStringArray.last else {return}
            let numberTuple = numbersArray.removeLast()
            
            //delete and fix
            if numberTuple.sign {
                inputText = inputText.prefix(inputText.count - numberString.count) + "(-" + numberString
                numbersArray.append((numberTuple.num,false))
            } else {
                inputText = inputText.prefix(inputText.count - numberString.count - 2) + numberString
                numbersArray.append((numberTuple.num,true))
            }
        }
        
        reCalculate()
        currentSign = !currentSign
        
        //set label
        inputTextView.text = inputText
    }
    
    @IBAction func percentBtn(_ sender: UIButton) {
        //don't enter number after persent (just op)
        if !numberExist {return}
        
        //lets get the last number to modify it
        var number = numbersArray.removeLast()
        number.num /= 100
        
        //fix input text
        guard var numberString : String = numbersStringArray.removeLast() else {return}
        inputText = String(inputText.prefix(inputText.count - numberString.count))
        
        //find if it has "." but no 0! (why the fuck?)
        if numberString.last == "." {
            numberString += "0"
        }
        inputText += numberString + "%"
        
        //push back number and it's string
        var fixedNumber : Double = number.num
        if numberString != String(fixedNumber){
            fixedNumber = Double(String(number.num))!
        }
        numbersArray.append((fixedNumber , number.sign))
        numbersStringArray.append(numberString)
        
        //set text and recalculate
        percentExist = true
        inputTextView.text = inputText
        reCalculate()
        
    }
    
    
    
    /*----------------------Numbers And Point----------------------*/
    @IBAction func digitButtons(_ sender: UIButton) {
        
        if percentExist {return}
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
        numbersArray.append((Double(String(newNumberString))! , currentSign))
        
        //change input based on new number
        inputText = inputText.prefix(inputText.count - numberString.count) + newNumberString
        
        //re calculate whole input
        operatorExist = false
        numberExist = true
        reCalculate()
    }
    
    
    /*----------------------Calculate Logic----------------------*/
    func reCalculate(){
        //set lable with new input
        inputTextView.text = inputText
        
        //if we have 2 number in our list and we are sure that next number is entered then calculate result
        if (numbersArray.count > 1 && numberExist) || (percentExist && numberExist) {
            
            //clone arrays to calculate
            var numbersArrayTemp : [(num : Double, sign : Bool)] = numbersArray
            var operatorsArrayTemp : [Operators] = operatorsArray
            
            //search for * and / from left
            var index : Int = 0
            while (!operatorsArrayTemp.isEmpty && index < operatorsArrayTemp.count){
                if operatorsArrayTemp[index] == .multiply || operatorsArrayTemp[index] == .divide {
                    
                    //get number and operators from left
                    let currentOP : Operators = operatorsArrayTemp.remove(at: index)
                    let num1Tuple = numbersArrayTemp.remove(at: index)
                    let num2Tuple = numbersArrayTemp.remove(at: index)
                    let result : Double
                    
                    //fix number sign
                    let num1 : Double = num1Tuple.sign ? num1Tuple.num : -num1Tuple.num
                    let num2 : Double = num2Tuple.sign ? num2Tuple.num : -num2Tuple.num
                    
                    //lets calculate result
                    switch currentOP {
                    case .multiply : result = num1 * num2
                    case .divide : result = num1 / num2
                    default: return
                    }
                    
                    //fix double point
                    let resultString = String(result)
                    if let fixedResult = Double(resultString){
                        //push back result
                        numbersArrayTemp.insert((abs(result.rounded(toPlaces: 8)), fixedResult < 0 ? false : true) , at: index)
                        index -= 1
                    }
                }
                index += 1
            }
            
            //search for + and - from left
            index = 0
            while (!operatorsArrayTemp.isEmpty && index < operatorsArrayTemp.count){
                if operatorsArrayTemp[index] == .plus || operatorsArrayTemp[index] == .minus {

                    //get number and operators from left
                    let currentOP : Operators = operatorsArrayTemp.remove(at: index)
                    let num1Tuple = numbersArrayTemp.remove(at: index)
                    let num2Tuple = numbersArrayTemp.remove(at: index)
                    let result : Double
                    
                    //fix number sign
                    let num1 : Double = num1Tuple.sign ? num1Tuple.num : -num1Tuple.num
                    let num2 : Double = num2Tuple.sign ? num2Tuple.num : -num2Tuple.num

                    //lets calculate result
                    switch currentOP {
                    case .minus : result = num1 - num2
                    case .plus : result = num1 + num2
                    default: return
                    }

                    //push back result
                    numbersArrayTemp.insert((abs(result.rounded(toPlaces: 8)), result < 0 ? false : true ), at: index)
                    index -= 1
                }
                index += 1
            }
            
            //set result
            let resultTuple = numbersArrayTemp.removeFirst()
            let result = resultTuple.sign ? resultTuple.num : -resultTuple.num
            var resultString = String(result)
            if resultString.contains(".") {
                resultString = String(resultString.split(separator: ".")[1]) == "0" ? String(resultString.dropLast(2)) : resultString
            }
            resultLable.text = resultString
        }
        
    }
    
}
