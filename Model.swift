//
//  Model.swift
//  AwesomeAPP
//
//  Created by zengshihang on 11/7/16.
//  Copyright © 2016 zengshihang. All rights reserved.
//

import Foundation

class Model{
    private var maxHeight: Double
    
    init(){
        maxHeight = NSUserDefaults.standardUserDefaults().doubleForKey("Max")
    }
    
    func getMax() -> Double {
        return NSUserDefaults.standardUserDefaults().doubleForKey("Max")
    }
    func setMax(d:Double) -> Void{
        if(d>NSUserDefaults.standardUserDefaults().doubleForKey("Max")){
            NSUserDefaults.standardUserDefaults().setDouble(d, forKey: "Max")
        }
        
    }
    
    
    
}