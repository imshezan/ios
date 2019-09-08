//
//  NavViewController.swift
//  timer
//
//  Created by Nazmus Sakib on 8/6/19.
//  Copyright © 2019 ConstantMD. All rights reserved.
//

import UIKit

class NavViewController: UIViewController {
    var stopWatchTimer: Timer! = nil
    var timerTimer: Timer! = nil

   
    
    @IBOutlet weak var lblStopWatch: UILabel!
    @IBOutlet weak var btnStopWatchStart: UIButton!
    @IBOutlet weak var btnStopWatchStop: UIButton!
    
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var btnTimerStart: UIButton!
    @IBOutlet weak var btnTimerStop: UIButton!
    @IBOutlet weak var txtHour: UITextField!
    @IBOutlet weak var txtMinute: UITextField!
    @IBOutlet weak var txtSec: UITextField!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
        btnTimerStop.isEnabled = true
        lblStopWatch.text = "00:00:00"
            
        //btnTimerStart.isEnabled = false
            lblTimer.text = "00:00:00"
    }
    
    
    @IBAction func stopwatchStartPressed(_ sender: UIButton) {
        
        var elspedTime: Int = 0
        var HHtime: Int = 0
        var MMtime: Int = 0
        var MStime: Int = 0
        var SStime: Int = 0
        var pSStime: Int = 0
        

        elspedTime = 0
        btnStopWatchStart.isEnabled = false
        btnStopWatchStart.alpha = 0.5
        
        self.stopWatchTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (t) in
            elspedTime += 1
            
            MStime = (elspedTime % 100)
            SStime = (elspedTime / 100)
            pSStime = (SStime % 60)
            MMtime = (SStime / 60)
            HHtime = (MMtime / 60)

            
            self.lblStopWatch.text = "\(HHtime) : \(MMtime) : \(pSStime) : \(MStime)"
            
        }
    }
    
    @IBAction func stopwatchStopPressed(_ sender: UIButton) {
        btnStopWatchStart.isEnabled = true
        btnStopWatchStart.alpha = 1
        
        if let timer = stopWatchTimer {
            timer.invalidate()
        }
        
    } //End stop Watch

    
    @IBAction func btnStartTimer(_ sender: Any) {
        
        var totalTime: Int = 0
        let hour: String = txtHour.text!
        let min: String = txtMinute.text!
        let sec: String = txtSec.text!
        var intH: Int = Int(hour) ?? 00
        var intM: Int = Int(min) ?? 00
        var intS: Int = Int(sec) ?? 00
        
        totalTime = ((((intH * 60) + intM) * 60) + intS)
        lblTimer.text = "\(totalTime)"
        
        
        btnTimerStart.isEnabled = true
        btnTimerStart.alpha = 0.5
        
        self.timerTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (t) in
            totalTime -= 1
            var seconds = totalTime
            var showHour: Int = (seconds/3600)
            seconds = seconds % 3600
            var showMin: Int = (seconds / 60)
            seconds = seconds % 60

            self.lblTimer.text = " \(showHour) : \(showMin) : \(seconds)"
        })
    }
    
    @IBAction func btnTimerStopPressed(_ sender: UIButton) {
        btnTimerStart.isEnabled = true
        btnTimerStart.alpha = 1
        if let timer = timerTimer{
            timer.invalidate()
            
        }
    }
    
    
//back batton
    @IBAction func Back2Pressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
