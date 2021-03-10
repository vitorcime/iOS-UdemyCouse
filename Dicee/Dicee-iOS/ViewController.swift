//
//  ViewController.swift
//  Dicee-iOS
//
//  Created by Vitor on 19/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let diceImages:[UIImage] = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]

    @IBAction func rollButtonPressed(_ sender: Any) {
        diceImageView1.image = diceImages.randomElement()
        diceImageView2.image = diceImages.randomElement()
    }
    
}

