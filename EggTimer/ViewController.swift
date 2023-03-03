//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes: [String : Int] = ["Soft": 5, "Medium": 8, "Hard": 12]
    
    var eggCookingTime: Int?
    
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        titleLabel.text = "Cooking egg!"
        let hardness = sender.currentTitle!
        timer.invalidate()
        
        switch(hardness){
        case "Soft":
            eggCookingTime = eggTimes["Soft"]!
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        case "Medium":
            eggCookingTime = eggTimes["Medium"]!
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        case "Hard":
            eggCookingTime = eggTimes["Hard"]!
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        default:
            print("undefined hardness")
        }
    }

    @objc func updateTimer() {
        if(eggCookingTime! > 0) {
            eggCookingTime! -= 1
            print(eggCookingTime!)
        } else if (eggCookingTime == 0){
            titleLabel.text = "Done!"
        }
    }
}
