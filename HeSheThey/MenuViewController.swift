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
        
        let topLeft = UIImageView(frame: CGRect(x: -247 + buttonWidth, y: -75 + buttonHeight, width: buttonWidth, height: buttonHeight))
        topLeft.image = UIImage(named: "blueframe")
        topLeft.isUserInteractionEnabled = true
        self.view.addSubview(topLeft)

        let labelTL = UILabel(frame: CGRect(x: 150, y: -75 + buttonHeight, width: buttonWidth, height: buttonHeight))
        labelTL.text = "Flashcards"
        labelTL.font = UIFont(name: "ChalkboardSE-Regular", size: 45)
        labelTL.textColor = .black
        self.view.addSubview(labelTL)
        
        
        let topRight = UIImageView(frame: CGRect(x: 95 + buttonWidth, y: -75 + buttonHeight, width: buttonWidth, height: buttonHeight))
        topRight.image = UIImage(named: "greenframe")
        topRight.isUserInteractionEnabled = true
        self.view.addSubview(topRight)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toGame))
        topRight.addGestureRecognizer(tapGestureRecognizer)
        

        let labelTR = UILabel(frame: CGRect(x: 530, y: -75 + buttonHeight, width: buttonWidth, height: buttonHeight))
        labelTR.text = "Game"
        labelTR.font = UIFont(name: "ChalkboardSE-Regular", size: 45)
        labelTR.textColor = .black
        self.view.addSubview(labelTR)
        
        
        

        
       
        let bottomLeft = UIImageView(frame: CGRect(x: 85, y: 70 + buttonHeight, width: buttonWidth, height: buttonHeight))
        bottomLeft.image = UIImage(named: "yellowframe")
        bottomLeft.isUserInteractionEnabled = true

        self.view.addSubview(bottomLeft)

        let labelBL = UILabel(frame: CGRect(x: 200, y: 70 + buttonHeight, width: buttonWidth, height: buttonHeight))
        labelBL.text = "Menu"
        labelBL.font = UIFont(name: "ChalkboardSE-Regular", size: 45)
        labelBL.textColor = .black
        self.view.addSubview(labelBL)
             
        
        
        let bottomRight = UIImageView(frame: CGRect(x: 95 + buttonWidth, y: 70 + buttonHeight, width: buttonWidth, height: buttonHeight))
        bottomRight.image = UIImage(named: "redframe")
        bottomRight.isUserInteractionEnabled = true
        self.view.addSubview(bottomRight)
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(toAbout))
        bottomRight.addGestureRecognizer(tapGestureRecognizer1)
        

        let labelBR = UILabel(frame: CGRect(x: 530, y: 70 + buttonHeight, width: buttonWidth, height: buttonHeight))
        labelBR.text = "About"
        labelBR.font = UIFont(name: "ChalkboardSE-Regular", size: 45)
        labelBR.textColor = .black
        self.view.addSubview(labelBR)
        
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
