//
//  LaunchViewController.swift
//  HeSheThey
//
//  Created by Josh Rubin on 3/4/23.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
        let image = UIImage(imageLiteralResourceName: "BEEMOO.png")
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
    
    }

}
