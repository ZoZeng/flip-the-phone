//
//  ViewController.swift
//  AwesomeAPP
//
//  Created by zengshihang on 10/19/16.
//  Copyright © 2016 zengshihang. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    
    
    
    var rad : Double = 0.0
    var rod : Int = 0

    var motionManager = CMMotionManager()
    
    
    
    
    
    
    @IBOutlet var round: UILabel!
    
    @IBOutlet weak var rButton: UIButton!
    
    
    override func viewDidLoad() {
        rButton.layer.cornerRadius=5
        motionManager.gyroUpdateInterval=0.01
        motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { (gyroData: CMGyroData?, NSError) -> Void in
            self.outputRotData(gyroData!.rotationRate)
            if (NSError != nil){
                print("\(NSError)")
            }
            
            
        })
        super.viewDidLoad()
        
    }
    func outputRotData(rotation: CMRotationRate){
        
      
        
        
        
        
    
        rad = fabs(rotation.x)*0.01+rad
        if(rad>=2*M_PI){
            rod = rod+1
           round?.text = "\(rod)"
            rad = 0.0
        }
        
    
        
    }

    override func didReceiveMemoryWarning() {
        
        
        
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

