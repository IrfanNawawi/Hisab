//
//  ViewController.swift
//  Hisab
//
//  Created by JOINKLU on 21/03/20.
//  Copyright © 2020 IrfanNawawi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelNumberShow: UILabel!
    
    //properties
    var isNewOperation = true
    var selectedOp = "+"
    var number1: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionNumberTapped(_ sender: Any) {
        let selectedButton = sender as! UIButton
        let tapedNumber = selectedButton.titleLabel?.text
        addNumberToInput(number: tapedNumber!)
    }
    
    
    @IBAction func actionOpTapped(_ sender: Any) {
        let buttonOp = sender as! UIButton
        selectedOp = buttonOp.titleLabel?.text ?? "+"
        number1 = Double(labelNumberShow.text!)
        isNewOperation = true
    }
    
    @IBAction func actionEqualsTapped(_ sender: Any) {
        let number2 = Double(labelNumberShow.text!)
        var results: Double?
        switch selectedOp {
        case "+":
            results = number1! + number2!
        case "-":
            results = number1! - number2!
        case "/":
            results = number1! / number2!
        case "x":
            results = number1! * number2!
        default:
            results = 0.0
        }
        
        labelNumberShow.text = String(results!)
        isNewOperation = true
    }
    
    @IBAction func actionResetTapped(_ sender: Any) {
        isNewOperation = true
        labelNumberShow.text = "0"
        number1 = 0
    }
    
    func addNumberToInput(number: String) {
        var textNumber = String(labelNumberShow.text!)
        if isNewOperation {
            textNumber = ""
            isNewOperation = false
        }
        textNumber = textNumber + number
        labelNumberShow.text = textNumber
    }
    
}

