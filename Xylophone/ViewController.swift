//
//  ViewController.swift
//  Xylophone
//
//  Created by Donlaya on 8/24/2561 BE.
//  Copyright © 2561 Donlaya. All rights reserved.
//

import UIKit
import AVFoundation
import ChameleonFramework

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var logoImage: UIImageView!
    
    var sound : AVAudioPlayer!
    var mySound = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var userChose = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()
        
        setBackground()
    }
    
    @IBAction func keyButton(_ sender: UIButton) {
        
        userChose = mySound[sender.tag]
        
        xylophone()
    }
    
    func xylophone() {
        
        let soundURL = Bundle.main.url(forResource: userChose, withExtension: "wav")
        do {
            try sound = AVAudioPlayer(contentsOf: soundURL!)
        } catch  {
            print(error)
        }
        sound.play()
    }
    
    func setImage() {
        
        self.logoImage.image = UIImage(named: "logo")
    }
    
    func setBackground() {
        
        view.backgroundColor = UIColor.randomFlat()
    }
    
}

