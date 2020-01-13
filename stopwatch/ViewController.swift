//
//  ViewController.swift
//  stopwatch
//
//  Created by Jimin Huh on 1/11/20.
//  Copyright © 2020 Jimin Huh. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    var timer: Timer?
    var isStarted = false
    var counter = 0.0
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var start: UIButton!
    

    
    @objc func updateTimerLabel() {
        counter += 0.1
        timerLabel.text = String(format: "%.1f", counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startButtonDidClick(_ sender: UIButton) {
        if isStarted {
            timer?.invalidate()
            isStarted = false
            start.setTitle("Start", for: .normal)
        }else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
            isStarted = true
            start.setTitle("Stop", for: .normal)
        }
    }
    
    @IBAction func resetButtonDidClick(_ sender: UIButton) {
        isStarted = false
        timerLabel.text = String("0.0")
        counter = 0.0
    }
    
}

