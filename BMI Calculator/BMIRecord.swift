//
//  BMIRecord.swift
//  BMI Calculator
//
//  Created by Keshav Dulal on 17/12/2021.
//

import Foundation

struct BMIRecord {
    
    let date: String
    let bmi: Double
    let category:String
    
    init(date: String, bmi: Double = 0, category:String = "") {
        self.date = date
        self.bmi = bmi
        self.category = category
    }
    
}
