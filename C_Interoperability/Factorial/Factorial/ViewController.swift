//
//  ViewController.swift
//  Factorial
//
//  Created by vine on 2020/3/24.
//  Copyright © 2020 vine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculationClick(_ sender: UIButton) {
        guard let text = inputTextField.text else {
            return
        }
        guard let number = Int32(text) else {
            return
        }
        let calculationResult = factorial(number)
        
        displayLabel.text = "\(number) 的 阶乘 是: \(calculationResult)"
    }
    
}

