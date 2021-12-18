//
//  SummaryViewController.swift
//  BMI Calculator
//
//  Created by Keshav Dulal on 17/12/2021.
//  Student ID 301209947
//

import UIKit


class SummaryViewController: UIViewController {
    
    @IBOutlet weak var summaryTV: UITableView!
    
    // store your records here
    var records = [
        BMIRecord(date:Date().description, bmi:20, category:"Normal"),
        BMIRecord(date:Date().description, bmi:21, category:"Normal"),
        BMIRecord(date:Date().description, bmi:22, category:"Normal")
    ]
    
    var _date:String = ""
    var _bmi:Double = 11.0
    var _category:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // refer to MAIN VC for delegate
        let mainVC = ViewController()
        mainVC.summaryDelegate = self
        
        summaryTV.delegate = self
        summaryTV.dataSource = self
    }
}


extension SummaryViewController: SummaryDelegate{
    func didPassData(date:String,bmi:Double, category:String){
        // store data in a state maybe
        // & later show data on table view
        
        _date = date
        _bmi = bmi
        _category = category
    }
    
}

// these functions handle interactions with TV
extension SummaryViewController: UITableViewDelegate{
    // section -> rows -> content

}

 
extension SummaryViewController: UITableViewDataSource{
    // section -> rows -> content
    
    
    // return number of items to be shown in the UITableView
    func tableView(_ summaryTV: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
//        return 100
    }
    
    // map source data array here to each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // asking TV to create us a cell using the prototype cell
        let cell = summaryTV.dequeueReusableCell(withIdentifier: "myTableCellReuseIdentifier", for: indexPath) as! ActionsOnTableViewCell
        

        let record = records[indexPath.row]
        
        // simple way to set values on cell
//        cell.textLabel?.text = String(record.bmi)
        
        cell.setValues(date: record.date, bmi: record.bmi, category: record.category)
        
        return cell
    }
    
    
}
