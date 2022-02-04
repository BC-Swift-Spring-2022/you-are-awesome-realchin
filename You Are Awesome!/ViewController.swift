//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Timothy Chin on 1/22/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    let totalNumberOfImages = 9
    let totalNumberOfSounds = 6
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("🤬 ERROR: \(error.localizedDescription) Could not initialize AvAudioPlayer object")
            }
        } else {
            print("🤬 ERROR: Could not read data from file sound0")
        }
    }
    
    func nonRepeatingRandom(originalNumber: Int, upperLimit: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperLimit)
        } while originalNumber == newNumber
        return newNumber
    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "When the Genius Bar Needs Help, They Call You",
                        "Fabulous? That's You!",
                        "You've Got the Design Skills of Jony Ive"]
        
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperLimit: messages.count-1)
        messageLabel.text = messages[messageNumber]
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperLimit: totalNumberOfImages-1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperLimit: totalNumberOfSounds-1)
        
        if playSoundSwitch.isOn { // if playSoundSwitch is on
            playSound(name: "sound\(soundNumber)") // then play the sound
        }
        
        
        
        // print("*** The new Sound Number is \(soundNumber)")
        
//        messageLabel.text = messages[messageNumber]
//        messageNumber += 1
//
//        if messageNumber == messages.count {
//            messageNumber = 0
//        }
        
        // let imageName = "image" + String(imageNumber)
//        let imageName = "image\(imageNumber)" // string interpolation
//        imageView.image = UIImage(named: imageName)
//        imageNumber = imageNumber + 1
//
//        if imageNumber == 10 {
//            imageNumber = 0
//        }
                
        //        let awesomeMessage = "You Are Awesome!"
        //        let greatMessage = "You Are Great!"
        //        let bombMessage = "You Are Da Bomb!"
        //
        //        if messageLabel.text == awesomeMessage {
        //            messageLabel.text = greatMessage
        //            imageView.image = UIImage(named: "image1")
        //
        //        } else if messageLabel.text == "You Are Great!"{
        //            messageLabel.text = bombMessage
        //            imageView.image = UIImage(named: "image2")
        //
        //        } else {
        //            messageLabel.text = awesomeMessage
        //            imageView.image = UIImage(named: "image0")
        //        }
        
    }
    
    @IBAction func playSoundToggled(_ sender: UISwitch) {
        if !sender.isOn && audioPlayer != nil { // if .isOn is NOT true
                audioPlayer.stop() // stop playing
        }
        
    }
    
}


