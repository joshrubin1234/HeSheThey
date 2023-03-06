//
//  AboutVewController.swift
//  HeSheThey
//
//  Created by Josh Rubin on 3/5/23.
//
import UIKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let scrollView = UIScrollView(frame: self.view.frame)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2)
        self.view.addSubview(scrollView)
        
        let headerLabel = UILabel(frame: CGRect(x: 40, y: 90, width: self.view.frame.width, height: 50))
        headerLabel.text = "About the App"
        headerLabel.font = UIFont(name: "Arial", size: 50)
        scrollView.addSubview(headerLabel)
        
        let paragraphLabel = UILabel(frame: CGRect(x: 40, y: -125, width: self.view.frame.width * 0.85, height: self.view.frame.height * 2 - 50))
        paragraphLabel.text = "This is an application to help kids learn about pronouns. Pronouns are words that can take the place of nouns in a sentence. For example, instead of writing 'Kelsey ate a sandwich', you could write 'She ate a sandwich'. In this app, kids will learn about the different types of pronouns in a fun and interactive way. They will be presented with different scenarios and have to choose the correct pronoun to complete the sentence. This will help them to start using pronouns with more confidence in their everyday speech."
        paragraphLabel.font = UIFont(name: "Arial", size: 20)
        paragraphLabel.textAlignment = .left
        paragraphLabel.numberOfLines = 0
        scrollView.addSubview(paragraphLabel)
        
        let homeButton = UIButton(frame: CGRect(x: 15, y: 15, width: 44, height: 44))
        homeButton.setImage(UIImage(named: "bluehome"), for: .normal)
        homeButton.addTarget(self, action: #selector(_dismiss), for: .touchUpInside)
        scrollView.addSubview(homeButton)
        
    }
    
    @objc func _dismiss(){
        self.dismiss(animated: true)
    }
 
}
