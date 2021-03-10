//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var currentTip: Double = 0.1
    var currentNumberOfPeople: Double = 2
    var totalValue: Double = 0.0

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender.currentTitle {
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            currentTip = 0.0
        case "10%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            currentTip = 0.1
        case "20%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            currentTip = 0.2
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        currentNumberOfPeople = sender.value
        splitNumberLabel.text = String(format: "%.0f", currentNumberOfPeople)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let valueString = billTextField.text else { return }
        guard let currentValue = Double(valueString) else { return  }
        let total = (currentValue + (currentTip * currentValue)) / currentNumberOfPeople
        totalValue = total
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = totalValue
        }
    }
    

}

