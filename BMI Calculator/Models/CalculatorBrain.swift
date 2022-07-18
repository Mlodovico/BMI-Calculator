//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Murilo Lodovico on 06/07/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    let underweightColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    let normalColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    let overweightColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    
    func getBMIValue() -> String {
            
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
            return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    mutating func calculateBMI(h: Float, w: Float) {
        let result = w / (h * h)
        
        if result < 18.5 {
            bmi = BMI(value: result, advice: "Eat more pies", color: underweightColor)
        }
        else if result < 24.9 {
            bmi = BMI(value: result, advice: "Fit as a fiddle", color: normalColor)
            print("Normal", result)
        }
        else {
            bmi = BMI(value: result, advice: "Eat less pies", color: overweightColor)
            print("Overweight", result)
        }
    }
}
