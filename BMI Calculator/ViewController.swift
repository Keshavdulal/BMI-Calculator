//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Keshav Dulal on 16/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    
    // labels
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    // button labels
    @IBOutlet weak var metricButton: UIButton!
    @IBOutlet weak var imperialButton: UIButton!
    
    // Defaults
    var isMetric:Bool = true
    var BMI:Double = 0
    var category:String = ""
    var todaysDate = Date().description
    
    //
    var name:String = ""
    var age:String = ""
    var gender:String = ""
    var weight:String = ""
    var height:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetDisplayState()
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        // 1 - Collect input (Name, Age, Gender, Weight, Height, Measurement System, Date)
        // 2 - Calculate BMI & Category
        // 3 - Navigate to 2nd Screen with results (Date, BMI, Category)
        
        name = nameTF.text!
        age = ageTF.text!
        gender = genderTF.text!
        weight = weightTF.text!
        height = heightTF.text!
        
        if(weight == "" && height == ""){
            showAlert()
        }else{
            
            
            
            let weigthFloat = Double(weight)
            let heightFloat = Double(height)
            //
            if(isMetric){
                // apply metric formulla
                BMI = weigthFloat! / (heightFloat! / 100 * heightFloat! / 100 )
            }else{
                // apply imperial formulla
                BMI = (weigthFloat! * 703) / (heightFloat! * heightFloat!)
            }
            
            //        // Determine Category
            switch true {
            case (BMI < 16) :
                category = "Severe Thinness"
            case (BMI >= 16 && BMI < 17) :
                category = "Moderate Thinness"
            case (BMI >= 17 && BMI < 18.5 ) :
                category = "Mild Thinness"
            case (BMI >= 18.5 && BMI < 25 ) :
                category = "Normal"
            case (BMI >= 25 && BMI < 30 ) :
                category = "Overweight"
            case (BMI >= 30 && BMI < 35 ) :
                category = "Obese Class I"
            case (BMI >= 35 && BMI < 40 ) :
                category = "Obese Class II"
            case (BMI >= 40 ) :
                category = "Obese Class III"
                
            default :
                category = "N/A"
            }
            
            
            resultsLabel.text = "BMI:" + String(BMI.reduceScale(to: 2)) + "\nCategory:" + category

            resultsLabel.numberOfLines = 0 // prevents ...
        }
    }
    
    // metric setter
    @IBAction func setIsMetricTrue(_ sender: Any) {
        resetDisplayState()
    }
    
    // imperial setter
    @IBAction func setIsMetricToFalse(_ sender: Any) {
        isMetric = false;
        metricButton.backgroundColor = UIColor.gray
        imperialButton.backgroundColor = UIColor.blue
        
        weightLabel.text = "Weight (lb)"
        heightLabel.text = "Height (in)"
    }
    
    func resetDisplayState(){
        isMetric = true;
        metricButton.backgroundColor = UIColor.blue
        imperialButton.backgroundColor = UIColor.gray
        
        weightLabel.text = "Weight (kg)"
        heightLabel.text = "Height (cm)"
    }
    
    func showAlert(){
        
        let alert = UIAlertController(title: "Input Error", message: "Enter Weight & Height", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title:"Ok",style: .cancel,handler: { action in
            print("Cancel Tapped")
        }))
        
        present(alert, animated: true)
    }
}

extension Double {
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self // move the decimal right
        let truncated = Double(Int(newDecimal)) // drop the fraction
        let originalDecimal = truncated / multiplier // move the decimal back
        return originalDecimal
    }
}

