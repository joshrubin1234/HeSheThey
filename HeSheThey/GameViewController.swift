//
//  GameViewController.swift
//  HeSheThey
//
//  Created by Josh Rubin on 3/5/23.
//

import UIKit
import AVFoundation
class GameViewController: UIViewController, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer?
    var gameView: UIView!
    var skipInstructionsButton: UIButton!
    var beginButton: UIButton!
    var rightButton: UIButton!
    var leftButton: UIButton!
    var middleButton: UIButton!
    var index: Int = 0
    var randomIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playInstructionsSound()
    
        
        

        beginButton = UIButton(frame: CGRect(x: self.view.frame.size.width/2 - 50, y: self.view.frame.size.height - 64, width: 100, height: 44))
        beginButton.setTitle("Begin!", for: .normal)
        beginButton.titleLabel?.font = UIFont(name: "ChalkboardSE-Regular", size: 24)
        beginButton.setTitleColor(UIColor.blue, for: .normal)
    
        beginButton.addTarget(self, action: #selector(_revealGameView), for: .touchUpInside)
        self.view.addSubview(beginButton)
        
        
     
       
        let homeButton = UIButton(frame: CGRect(x: 15, y: 15, width: 44, height: 44))
        homeButton.setImage(UIImage(named: "bluehome"), for: .normal)
        homeButton.addTarget(self, action: #selector(_dismiss), for: .touchUpInside)
        self.view.addSubview(homeButton)
        
        // Set up the sound button
        let soundButton = UIButton(frame: CGRect(x: self.view.frame.size.width - 64, y: 15, width: 44, height: 44))
        soundButton.setImage(UIImage(named: "soundButton"), for: .normal)
        soundButton.addTarget(self, action: #selector(soundButtonClicked), for: .touchUpInside)
        self.view.addSubview(soundButton)
       
        let listeningManImage = UIImageView(frame: CGRect(x: self.view.frame.size.width/2 - 130, y: 15, width: 270, height: 180))
        listeningManImage.image = UIImage(named: "listeningMan")
        self.view.addSubview(listeningManImage)
  
        
        let path = Bundle.main.path(forResource: "instructions", ofType: "wav")
                let soundURL = URL(fileURLWithPath: path!)
                do {
                    let audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                    audioPlayer.volume = 1.0
                    audioPlayer.play()

                } catch {
                    print("Error")
                }
        
        let homeButton1 = UIButton(frame: CGRect(x: 15, y: 15, width: 44, height: 44))
        homeButton1.setImage(UIImage(named: "bluehome"), for: .normal)
        homeButton1.addTarget(self, action: #selector(_dismiss), for: .touchUpInside)
        self.view.addSubview(homeButton1)
        
        let buttonWidth: CGFloat = 250
        let buttonHeight: CGFloat = 250
        let spaceBetweenButtons: CGFloat = 10

        let leftButtonX = (view.frame.width / 2.7) - (buttonWidth + (spaceBetweenButtons / 2))
        let leftButtonY = (view.frame.height / 2) - (buttonHeight / 2)
         leftButton = UIButton(frame: CGRect(x: leftButtonX, y: leftButtonY, width: buttonWidth, height: buttonHeight))

        let middleButtonX = view.frame.width / 2.7
        let middleButtonY = (view.frame.height / 2) - (buttonHeight / 2)
         middleButton = UIButton(frame: CGRect(x: middleButtonX, y: middleButtonY, width: buttonWidth, height: buttonHeight))

        let rightButtonX = (view.frame.width / 2.7) + (buttonWidth + (spaceBetweenButtons / 2))
        let rightButtonY = (view.frame.height / 2) - (buttonHeight / 2)
         rightButton = UIButton(frame: CGRect(x: rightButtonX, y: rightButtonY, width: buttonWidth, height: buttonHeight))
        
        let firstFlashcard = flashcards[index]
        let leftImage = UIImage(named: firstFlashcard.0)
        let middleImage = UIImage(named: firstFlashcard.1)
        let rightImage = UIImage(named: firstFlashcard.2)
        
        leftButton.setImage(leftImage, for: .normal)
        middleButton.setImage(middleImage, for: .normal)
        rightButton.setImage(rightImage, for: .normal)
        
        leftButton.backgroundColor = .white
        leftButton.layer.borderWidth = 2
        leftButton.layer.borderColor = UIColor.black.cgColor

        middleButton.backgroundColor = .white
        middleButton.layer.borderWidth = 2
        middleButton.layer.borderColor = UIColor.black.cgColor

        rightButton.backgroundColor = .white
        rightButton.layer.borderWidth = 2
        rightButton.layer.borderColor = UIColor.black.cgColor
        
        
      
        let switchButton = UIButton(frame: CGRect(x: rightButton.frame.maxX + 10, y: rightButton.frame.minY, width: 50, height: 50))
        switchButton.setTitle("Next", for: .normal)
        switchButton.backgroundColor = .white
        switchButton.layer.borderWidth = 2
        switchButton.layer.borderColor = UIColor.black.cgColor

//        switchButton.addTarget(self, action: #selector(switchFlashcards), for: .touchUpInside)

//       let initialButtons = [leftButton, middleButton, rightButton]
        leftButton.contentMode = .scaleAspectFit
        middleButton.contentMode = .scaleAspectFit
        rightButton.contentMode = .scaleAspectFit
        switchButton.addTarget(self, action: #selector(nextFlashcard), for: .touchUpInside)
        gameView = UIView(frame: self.view.frame)
        gameView.backgroundColor = UIColor.white
        gameView.isHidden = true
        gameView.addSubview(homeButton1)
        gameView.addSubview(leftButton)
        gameView.addSubview(middleButton)
        gameView.addSubview(rightButton)
        gameView.addSubview(switchButton)
        self.view.addSubview(gameView)
        
    }
   
    func playInstructionsSound() {
        guard let url = Bundle.main.url(forResource: "instructions", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
     
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.delegate = self
            audioPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    


//
//    @objc func switchFlashcards(_ sender: UIButton) {
//            let randomIndex = Int.random(in: 0 ..< flashcards.count)
//            let buttons = [leftButton, middleButton, rightButton]
//
//            index = (index + 1) % flashcards.count
//        }
    
    
        @objc func soundButtonClicked(sender: UIButton!) {
        if !(audioPlayer?.isPlaying ?? false) {
                    playInstructionsSound()
                }
        }
 
    @objc func nextFlashcard(){
        index += 1
        if index == flashcards.count{
            index = 0
        }
        let nextFlashcard = flashcards[index]
        let leftImage = UIImage(named: nextFlashcard.0)
        let middleImage = UIImage(named: nextFlashcard.1)
        let rightImage = UIImage(named: nextFlashcard.2)
        
        leftButton.setImage(leftImage, for: .normal)
        middleButton.setImage(middleImage, for: .normal)
        rightButton.setImage(rightImage, for: .normal)
    }
    @objc func _dismiss(){
        self.dismiss(animated: true)
    }

    @objc func _revealGameView(){
        gameView.isHidden = false
        audioPlayer?.stop()
//        if let soundPath = Bundle.main.path(forResource: flashcards[0].0, ofType: "wav") {
//            let soundUrl = URL(fileURLWithPath: soundPath)
//            do {
//                audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
//                audioPlayer?.play()
//            } catch {
//                print("Error")
//            }
//        }
    }
 
}
