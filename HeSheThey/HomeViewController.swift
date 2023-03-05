//
//  ViewController.swift
//  HeSheThey
//
//  Created by Josh Rubin on 3/4/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func myButton(_ sender: Any) {
        // Do something when the button is tapped
        performSegue(withIdentifier: "mySegue", sender: self)
    }

}

