//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var previousImage:UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]

    
    @IBAction func askButtonPressed(_ sender: Any) {
        var currentImage:UIImage?
        repeat {
            currentImage = ballArray.randomElement()
        } while currentImage == previousImage
        imageView.image = currentImage
        previousImage = currentImage
    }
    

}

