//
//  MenuViewController.swift
//  HeSheThey
//
//  Created by Josh Rubin on 3/4/23.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let homeButton = UIButton(frame: CGRect(x: 15, y: 15, width: 44, height: 44))
        homeButton.setImage(UIImage(named: "bluehome"), for: .normal)
        homeButton.addTarget(self, action: #selector(_dismiss), for: .touchUpInside)
                self.view.addSubview(homeButton)

        let buttonWidth = (self.view.frame.width - 180) / 2
        let buttonHeight = (self.view.frame.height - 120) / 2
        
        let topLeftButton = UIButton(frame: CGRect(x: 85, y: 60, width: buttonWidth, height: buttonHeight))
        topLeftButton.setTitle("Flashcards", for: .normal)
        topLeftButton.titleLabel?.font = UIFont(name: "ChalkboardSE-Regular", size: 20)
        topLeftButton.setTitleColor(.black, for: .normal)
        topLeftButton.backgroundColor = .purple
        self.view.addSubview(topLeftButton)
        
        
        let topRightButton = UIButton(frame: CGRect(x: 95 + buttonWidth, y: 60, width: buttonWidth, height: buttonHeight))
        topRightButton.setTitle("Game", for: .normal)
        topRightButton.titleLabel?.font = UIFont(name: "ChalkboardSE-Regular", size: 20)
        topRightButton.setTitleColor(.black, for: .normal)
        topRightButton.backgroundColor = .green
        topRightButton.addTarget(self, action: #selector(toGame), for: .touchUpInside)
        self.view.addSubview(topRightButton)

        
        let bottomLeftButton = UIButton(frame: CGRect(x: 85, y: 70 + buttonHeight, width: buttonWidth, height: buttonHeight))
        bottomLeftButton.setTitle("Menu", for: .normal)
        bottomLeftButton.titleLabel?.font = UIFont(name: "ChalkboardSE-Regular", size: 20)
        bottomLeftButton.setTitleColor(.black, for: .normal)
        bottomLeftButton.backgroundColor = .blue
        self.view.addSubview(bottomLeftButton)
        
        let bottomRightButton = UIButton(frame: CGRect(x: 95 + buttonWidth, y: 70 + buttonHeight, width: buttonWidth, height: buttonHeight))
        bottomRightButton.setTitle("About", for: .normal)
        bottomRightButton.titleLabel?.font = UIFont(name: "ChalkboardSE-Regular", size: 20)
        bottomRightButton.setTitleColor(.black, for: .normal)
        bottomRightButton.backgroundColor = .brown
        bottomRightButton.addTarget(self, action: #selector(toAbout), for: .touchUpInside)
        self.view.addSubview(bottomRightButton)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func _dismiss(){
        self.dismiss(animated: true)
    }
 
    @objc func toGame() {
            let gameVC = storyboard?.instantiateViewController(withIdentifier: "GameViewContoller") as! GameViewController
        gameVC.modalPresentationStyle = .fullScreen
        self.present(gameVC, animated: true, completion: nil)
        }
    @objc func toAbout() {
            let aboutVC = storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        aboutVC.modalPresentationStyle = .fullScreen
        self.present(aboutVC, animated: true, completion: nil)
        }


}
