//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes: [String : Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    var eggCookingTime: Int?
    var timer = Timer()
    var progressIncrement: Float = 0.0
    var player: AVAudioPlayer?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    
    override func viewDidLoad() {
        progressView.progress = 0.0
        super.viewDidLoad()
    }

    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        progressView.progress = 0.0
        titleLabel.text = "Cooking \(hardness) egg!"
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        switch(hardness){
        case "Soft":
            eggCookingTime = eggTimes["Soft"]!
        case "Medium":
            eggCookingTime = eggTimes["Medium"]!
        case "Hard":
            eggCookingTime = eggTimes["Hard"]!
        default:
            print("undefined hardness")
        }
        
        progressIncrement = 1.0 / Float(eggCookingTime!)
    }

    @objc func updateTimer() {
        if(eggCookingTime! > 0) {
            eggCookingTime! -= 1
            progressView.progress += progressIncrement
        } else if (eggCookingTime == 0){
            timer.invalidate()
            progressView.progress = 1.0
            playSound(resourceName: "alarm_sound")
            titleLabel.text = "Done!"
        }
    }
    
    func playSound(resourceName: String) {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "mp3") else {
            return
        }
        
        do {
            player = try! AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        
    }
}
