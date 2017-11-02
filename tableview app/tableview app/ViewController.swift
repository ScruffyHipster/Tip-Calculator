//
//  ViewController.swift
//  tableview app
//
//  Created by Tom Murray on 31/10/2017.
//  Copyright © 2017 Tom Murray. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var mealCost: Float?
    var tipPercent: Float = 20.0
    var divideAmount: Float?
    
    func finalCost() -> Float {
        return mealCost! + tipPercent / 100.00 * mealCost!
    }
    
    func divideAmountNum() -> Float {
        let fullCost = mealCost! + tipPercent
        return fullCost / divideAmount!
    }
   
    func updateFinalMealCost() {
        if mealCost != nil && divideAmount == nil {
            self.finalCostLabel.text  = "\(finalCost())"
        } else if mealCost != nil && divideAmount != nil {
            self.finalCostLabel.text = "\(divideAmountNum())"
        } else if (self.costTextField.text!.isEmpty) {
            self.finalCostLabel.text = ""
        } else {
            self.finalCostLabel.text = "Invalid Input"
        }
    }
    
    
    @IBOutlet weak var finalCostLabel: UILabel!
    @IBOutlet var costTextField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var divideByField: UITextField!
    
    
//slider to change the amount to tip
    
    @IBAction func tipSliderChanged(sender: UISlider) {
        
        self.tipPercent = round(sender.value)
        
        self.tipPercentLabel.text = "\(Int(self.tipPercent))"
        
        updateFinalMealCost()
        
    }
    
    @IBAction func costTextFieldChanged(sender: UITextField) {
        self.mealCost = Float(sender.text!)
        
        updateFinalMealCost()
    }
    
    @IBAction func divideByFieldChanged(sender: UITextField) {
        self.divideAmount = Float(sender.text!)
        
        updateFinalMealCost()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

