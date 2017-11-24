//
//  ViewController.swift
//  Hack Project
//
//  Created by Backpack Media on 11/8/17.
//  Copyright © 2017 Backpack Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let answer = ["yes", "no", "maybe", "try again", "Not today"]
    
    let colors = [UIColor.orange, UIColor.red, UIColor.yellow, UIColor.purple, UIColor.gray]

    @IBOutlet weak var answerLbl: UILabel!
    @IBAction func submitBtn(_ sender: Any) {
        print("I work")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            var num = arc4random_uniform(4)
            answerLbl.text = answer[Int(num)]
            self.view.backgroundColor = colors[Int(num)]
        }
    }
    


}

