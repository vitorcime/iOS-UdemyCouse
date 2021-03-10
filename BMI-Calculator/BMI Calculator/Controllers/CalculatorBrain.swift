//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Vitor on 05/03/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiToString = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToString
    }
    
    func getAdive() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    mutating func calculateBMI(height:Float, weight:Float) {
        let bmiValue = weight / powf(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
    
    
}
