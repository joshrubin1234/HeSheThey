//
//  ViewController.swift
//  HeSheThey
//
//  Created by Josh Rubin on 3/4/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.25))
        label.text = "HeSheThey"
        label.textAlignment = .center
        label.font = UIFont(name: "ChalkboardSE-Regular", size: 44)
        view.addSubview(label)
        
        
        let goButton = UIButton(type: .system)
        goButton.setTitle("Go", for: .normal)
        goButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 44)
        goButton.setTitleColor(.yellow, for: .normal)
        goButton.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)

        self.view.addSubview(goButton)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        goButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        

    }
    
    @objc func goButtonTapped() {
        let MenuVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        MenuVC.modalPresentationStyle = .fullScreen
        self.present(MenuVC, animated: true, completion: nil)
    }

}

