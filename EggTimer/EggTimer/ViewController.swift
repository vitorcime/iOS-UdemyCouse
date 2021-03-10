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
    
    var player: AVAudioPlayer!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var mainTitle: UILabel!
    var secondsPassed = 0.0
    var totalTime = 0.0
    let eggTimes = [
        "Soft": 300.0,
        "Medium": 420.0,
        "Hard": 720.0
    ]
    
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton!) {
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0.0
        guard let hardness = sender.currentTitle else { return }
        mainTitle.text = hardness
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if(secondsPassed < totalTime){
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed / totalTime)
        } else {
            timer.invalidate()
            playSound()
            mainTitle.text = "DONE!"
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }

}

