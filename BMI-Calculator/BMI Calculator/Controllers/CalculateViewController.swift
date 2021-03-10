//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightInformation: UILabel!
    @IBOutlet weak var weightInformation: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func heightChanged(_ sender: UISlider) {
        heightInformation.text = String(format: "%.1fm", sender.value)
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        weightInformation.text = String(format: "%.0fKg", sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weigt = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weigt)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdive()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

