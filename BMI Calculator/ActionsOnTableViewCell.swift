//
//  ActionsOnTableViewCell.swift
//  BMI Calculator
//
//  Created by Keshav Dulal on 18/12/2021.
//

import UIKit

class ActionsOnTableViewCell: UITableViewCell {

    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var bmiTF: UITextField!
    @IBOutlet weak var categoryTF: UITextField!
    
    @IBAction func insertCell(_ sender: Any) {
    }
    
    @IBAction func deleteCell(_ sender: Any) {
    }
    
    
    func setValues(date:String, bmi:Double, category:String){
        dateTF.text = date
        bmiTF.text = String(bmi)
        categoryTF.text = category
    }

}
