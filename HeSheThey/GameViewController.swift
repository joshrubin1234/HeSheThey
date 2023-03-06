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
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playInstructionsSound()
        let beginButton = UIButton(frame: CGRect(x: self.view.frame.size.width/2 - 50, y: self.view.frame.size.height - 64, width: 100, height: 44))
        beginButton.setTitle("Begin!", for: .normal)
        beginButton.titleLabel?.font = UIFont(name: "ChalkboardSE-Regular", size: 24)
        beginButton.setTitleColor(UIColor.blue, for: .normal)
    
        beginButton.addTarget(self, action: #selector(_revealGameView), for: .touchUpInside)
        self.view.addSubview(beginButton)
    
        let skipInstructionsButton = UIButton(frame: CGRect(x: self.view.frame.size.width - 310, y: self.view.frame.size.height - 64, width: 310, height: 44))
        skipInstructionsButton.setTitle("Skip Instructions", for: .normal)
        skipInstructionsButton.titleLabel?.font = UIFont(name: "ChalkboardSE-Regular", size: 24)
        skipInstructionsButton.setTitleColor(UIColor.red, for: .normal)
        skipInstructionsButton.addTarget(self, action: #selector(_revealGameView), for: .touchUpInside)
        skipInstructionsButton.isHidden = false
        self.view.addSubview(skipInstructionsButton)
       
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
        let leftButton = UIButton(frame: CGRect(x: leftButtonX, y: leftButtonY, width: buttonWidth, height: buttonHeight))

        let middleButtonX = view.frame.width / 2.7
        let middleButtonY = (view.frame.height / 2) - (buttonHeight / 2)
        let middleButton = UIButton(frame: CGRect(x: middleButtonX, y: middleButtonY, width: buttonWidth, height: buttonHeight))

        let rightButtonX = (view.frame.width / 2.7) + (buttonWidth + (spaceBetweenButtons / 2))
        let rightButtonY = (view.frame.height / 2) - (buttonHeight / 2)
        let rightButton = UIButton(frame: CGRect(x: rightButtonX, y: rightButtonY, width: buttonWidth, height: buttonHeight))
        
        
        leftButton.backgroundColor = .white
        leftButton.layer.borderWidth = 2
        leftButton.layer.borderColor = UIColor.black.cgColor

        middleButton.backgroundColor = .white
        middleButton.layer.borderWidth = 2
        middleButton.layer.borderColor = UIColor.black.cgColor

        rightButton.backgroundColor = .white
        rightButton.layer.borderWidth = 2
        rightButton.layer.borderColor = UIColor.black.cgColor
        
        gameView = UIView(frame: self.view.frame)
        gameView.backgroundColor = UIColor.white
        gameView.isHidden = true
        gameView.addSubview(homeButton1)
        gameView.addSubview(leftButton)
        gameView.addSubview(middleButton)
        gameView.addSubview(rightButton)
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

        @objc func soundButtonClicked(sender: UIButton!) {
        if !(audioPlayer?.isPlaying ?? false) {
                    playInstructionsSound()
                }
        }
    
    @objc func _dismiss(){
        self.dismiss(animated: true)
    }

    @objc func _revealGameView(){
        gameView.isHidden = false
        audioPlayer?.stop()
    }
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        beginButton?.isHidden = false
        skipInstructionsButton?.isHidden = true
    }
 
}
