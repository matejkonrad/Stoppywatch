//
//  ViewController.swift
//  Stopwatch
//
//  Created by Matej Konrad on 15/07/16.
//  Copyright © 2016 Matej Konrad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0.0
    var timer = NSTimer()
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func startTimer(sender: AnyObject) {
        if timer.valid {
            setCounterToZero()
            timer.invalidate()
        }
        else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(timerAction), userInfo: nil,repeats: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setCounterToZero() {
        counter = 0.0
        timerLabel.text = "\(counter)"
    }
    
    func timerAction() {
        counter += 0.1
        print(counter)
        timerLabel.text = "\(roundToPlaces(counter, places: 2))"
    }
    
    func roundToPlaces(value:Double, places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(value * divisor) / divisor
    }
}

