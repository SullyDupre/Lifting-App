//
//  ViewController.swift
//  LiftingApp
//
//  Created by Sullivan Dupre on 8/19/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    var timer: Timer?
    
    
    @IBOutlet weak var messageStatement: UILabel!
    
    @IBOutlet weak var seg1: UISegmentedControl!
    @IBOutlet weak var seg2: UISegmentedControl!
    @IBOutlet weak var seg3: UISegmentedControl!
    @IBOutlet weak var seg4: UISegmentedControl!
    @IBOutlet weak var seg5: UISegmentedControl!
    
    var isSet1Complete = false
    var isSet2Complete = false
    var isSet3Complete = false
    var isSet4Complete = false
    var isSet5Complete = false
    
    
    @IBOutlet weak var timerTracker: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer();
        messageStatement.text = ""
        
        for ind in 0...6 {
            seg2.setEnabled(false, forSegmentAt: ind)
        }
        for ind in 0...6 {
            seg3.setEnabled(false, forSegmentAt: ind)
        }
        for ind in 0...6 {
            seg4.setEnabled(false, forSegmentAt: ind)
        }
        for ind in 0...6 {
            seg5.setEnabled(false, forSegmentAt: ind)
        }
        
        // Do any additional setup after loading the view.
    }
    
    func enable(_ segment: UISegmentedControl){
        for ind in 0...6 {
            segment.setEnabled(true, forSegmentAt: ind)
        }
        //segment.selectedSegmentIndex = 0
    }
    
    func disable(_ segment: UISegmentedControl){
        for ind in 0...6 {
            segment.setEnabled(false, forSegmentAt: ind)
        }
        segment.selectedSegmentIndex = 0
    }

    @IBAction func set1(_ sender: Any) {
        if seg1.selectedSegmentIndex != 0{
            enable(seg2)
            stopTimer()
            startTimer()
            messageStatement.text = "Set 1 Complete"
        }
    }
    
    @IBAction func set2(_ sender: Any) {
        if seg2.selectedSegmentIndex != 0{
            enable(seg3)
            stopTimer()
            startTimer()
            messageStatement.text = "Set 2 Complete"
        }
    }
    
    @IBAction func set3(_ sender: Any) {
        if seg3.selectedSegmentIndex != 0{
            enable(seg4)
            stopTimer()
            startTimer()
            messageStatement.text = "Set 3 Complete"
        }
    }
    
    @IBAction func set4(_ sender: Any) {
        if seg4.selectedSegmentIndex != 0{
            enable(seg5)
            stopTimer()
            startTimer()
            messageStatement.text = "Set 4 Complete"
        }
        
    }
    
    @IBAction func set5(_ sender: Any) {
        if seg5.selectedSegmentIndex != 0{
            stopTimer()
            messageStatement.text = "Set 5 Complete, Congradulations You have Finished Your Exercise!"
            timerTracker.text = "00:00:00"
        }
    }
    
    
    @IBAction func resetWorkout(_ sender: Any) {
        reset()
    }
    
    func reset(){
        seg1.selectedSegmentIndex = 0
        seg2.selectedSegmentIndex = 0
        seg3.selectedSegmentIndex = 0
        seg4.selectedSegmentIndex = 0
        seg5.selectedSegmentIndex = 0
        messageStatement.text = ""
        stopTimer()
        
        disable(seg2)
        disable(seg3)
        disable(seg4)
        disable(seg5)
    }
    
    func stopTimer(){
        counter = 0
        timer?.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
    }
    
    @objc func count()
    {
        counter = counter + 1
        let hours = Int(counter) / 3600
        let minutes = Int(counter) / 60 % 60
        let seconds = Int(counter) % 60
        timerTracker.text  = String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    
    
}

