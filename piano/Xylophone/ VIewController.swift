                //
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
                
var player = AVAudioPlayer()
                
class ViewController: UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
            print(sender.tag) // testing button pressed tag
          //  print(sender.backgroundColor as Any)
        
            let path = Bundle.main.path(forResource: "note\(sender.tag)", ofType : "wav")!
            let url = URL(fileURLWithPath : path)
        
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
                
            }
            catch {
                
                print ("There is an issue with this code!")
                
            }
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        sender.transform = CGAffineTransform(scaleX: 0.8, y: 1.0)
                        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            sender.transform = CGAffineTransform.identity
                        }
            })
                
        }
    
}

