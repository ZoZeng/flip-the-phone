//
//  ViewC.swift
//  AwesomeAPP
//
//  Created by zengshihang on 11/2/16.
//  Copyright © 2016 zengshihang. All rights reserved.
//

//
//  ViewController.swift
//  AwesomeAPP
//
//  Created by zengshihang on 10/19/16.
//  Copyright © 2016 zengshihang. All rights reserved.
//

import UIKit
import CoreMotion

class ViewC: UIViewController {
    
    
    
    var counter : Int = 0
    var rad : Double = 0.0
    var rod : Int = 0
    var motionManager = CMMotionManager()
    var m = Model()
    
    
    
    
    
    @IBOutlet var round: UILabel!
    
    @IBOutlet var success: UILabel!
 
    @IBAction func reset() {
        round?.text="0"
        success?.text=""
        motionManager.accelerometerUpdateInterval=0.02
        motionManager.deviceMotionUpdateInterval=0.02
        motionManager.gyroUpdateInterval=0.02
    }
    
    @IBOutlet weak var rButton: UIButton!
    
    
    override func viewDidLoad() {
        success?.text=""
        motionManager.accelerometerUpdateInterval=0.02
        motionManager.deviceMotionUpdateInterval=0.02
        motionManager.gyroUpdateInterval=0.02
        
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { (accData: CMAccelerometerData?, NSError) -> Void in
            self.motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { (gData: CMDeviceMotion?, NSError) -> Void in
                self.outputAccData(accData!.acceleration)
                if (NSError != nil){
                    print("\(NSError)")
                }
                
            })
            
        })
        super.viewDidLoad()
      
        
    }
        
    
    
    func outputAccData(acc: CMAcceleration){
        let totalAcc : Double = sqrt(pow(acc.x,2)+pow(acc.y,2)+pow(acc.z,2))
        var time : Double = 0.0
       
        
        if(fabs(totalAcc)<0.1 && counter == 0){
            motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { (gyroData: CMGyroData?, NSError) -> Void in
                self.outputRotData(gyroData!.rotationRate)
                time = time + 0.02
                if (NSError != nil){
                    print("\(NSError)")
                }
                
            })
        }else if(rod>0){
           counter=1
        }
        
        if(fabs((totalAcc)) > 0.9 && counter == 1){
            motionManager.stopAccelerometerUpdates()
            motionManager.stopDeviceMotionUpdates()
            motionManager.stopGyroUpdates()
            time = time/2
            let height : Double = 0.5*9.8*pow(time,2)
            m.setMax(height)
            success?.text="\(m.getMax())"
            
        }
        
        
        
        
        
    }
    func outputRotData(rotation: CMRotationRate){

        
        let totalRoatationalV : Double=sqrt(pow(rotation.x,2)+pow(rotation.y,2)+pow(rotation.z,2))
        rad = fabs(totalRoatationalV)*0.02+rad
        
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
