//
//  ViewController.swift
//  Calculator
//
//  Created by Jesus Jaime Cano Terrazas on 19/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var auxNumber = 0
    private var operation = -1
    
    // MARK: - My Version
//    var currentOperation: String = ""
//    var firstNumber: String = ""
//    var secondNumber: String = ""
//    var operationOptions =
//        ["1": "/",
//        "2": "x",
//        "3": "-",
//        "4": "+",
//        "5": "=",
//        "6": "c"]

    @IBOutlet weak var resultFieldLabel: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.resultFieldLabel.text = ""
        
        self.resultButton.layer.cornerRadius = 15
    }
    
    // MARK: - User Interaction
    
    @IBAction func numbersButton(_ sender: UIButton) {
        
        
        
        if resultFieldLabel.text == "0" {
            self.resultFieldLabel.text = "\(sender.tag)"
        } else {
            if let currentNumber = resultFieldLabel.text {
                self.resultFieldLabel.text = "\(currentNumber)\(sender.tag)"
            }
        }
        
        // MARK: - My Version
        
//        self.resultFieldLabel.text = String(sender.tag)
//        if self.firstNumber == "" {
//            self.firstNumber = String(sender.tag)
//        } else {
//            self.secondNumber = String(sender.tag)
//        }
//
//        print("No 1: \(self.firstNumber) and No 2: \(self.secondNumber)")
        
    }
    
    @IBAction func currentOperation(_ sender: UIButton) {
        // 1 = /
        // 2 = *
        // 3 = -
        // 4 = +
        
        if sender.tag == 6 {
            self.auxNumber = 0
            self.resultFieldLabel.text = "0"
            self.operation = -1
        } else {
            if let currentDisplayNumberString = self.resultFieldLabel.text,
               let currentDisplayNumber = Int(currentDisplayNumberString){
                print(currentDisplayNumber)
                
                switch sender.tag {
                case 5:
                    self.finishOperation(number: currentDisplayNumber)
                case 4,1,2,3:
                    auxNumber = currentDisplayNumber
                    print("Numero Almacenado \(auxNumber)")
                    resultFieldLabel.text = "0"
                    operation = sender.tag
                default:
                    print("Nothing to do here")
                }
                
            } else {
                print("We cant get any number")
            }
        }
        
        // MARK: - My Version
//        if let operation = self.operationOptions[String(sender.tag)] {
//            if operation == "="  {
//                self.doOperation(operationToDo: self.currentOperation)
//            } else {
//                self.currentOperation = operation
//                self.doOperation(operationToDo: self.currentOperation)
//            }
//        } else {
//            self.currentOperation = "+"
//            self.doOperation(operationToDo: self.currentOperation)
//        }
        
    }
    
    // MARK: - Private methods (TEACHER)
    
    private func finishOperation(number: Int) {
        var result = 0
        
        switch self.operation {
        case 4:
            result = auxNumber + number
        case 3:
            result = auxNumber - number
        case 2:
            result = auxNumber * number
        case 1:
            if number != 0 {
                result = auxNumber / number
            } else {
                let alertController = UIAlertController(title: "Error", message: "No se puede dividir entre 0, pendejo", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default) { action in
                    print("User pressed OK")
                }
                
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
        default:
            print("Nothing to do here")
        }
        
        self.resultFieldLabel.text = "\(result)"
        self.auxNumber = result
    }
    
    // MARK: - My Version
//    func doOperation(operationToDo: String) {
//        switch operationToDo {
//        case "/":
//            print("División")
//        case "x":
//            print("Multiplicación")
//        case "-":
//            print("Menos")
//        case "+":
//            print("Suma")
//            self.add()
//        case "c":
//            print("Borrar")
//            self.firstNumber = ""
//            self.secondNumber = ""
//            self.resultFieldLabel.text = "0"
//        default:
//            print("Nothing to do")
//            break
//        }
//    }
  
    // MARK: - My Version
//    func add() {
//        if self.firstNumber != "" && self.secondNumber != "" {
//            let firstNumber: Int =  Int(self.firstNumber)!
//            let secondNumber: Int =  Int(self.secondNumber)!
//            let result = String(firstNumber + secondNumber)
//            print(result)
//            self.resultFieldLabel.text = result
//            self.firstNumber = result
//        }
//    }
    
    
    
}

