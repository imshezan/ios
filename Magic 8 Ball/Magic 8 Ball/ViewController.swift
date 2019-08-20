//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Nazmus Sakib on 8/20/19.
//  Copyright © 2019 ConstantMD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5", ]
    var randomBallNumber = 0
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newBallImage()
    }
    @IBAction func askButtonPressed(_ sender: Any) {
        newBallImage()
    }
    func newBallImage (){
        randomBallNumber = Int(arc4random_uniform(5))
        imageView.image = UIImage(named: "ball\(randomBallNumber)")
    }
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }

}

