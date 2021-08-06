//
//  FinancialViewController.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 02/08/21.
//

import UIKit

class FinancialViewController: UIViewController {

    @IBOutlet weak var outcomeButton: UIButton!
    @IBOutlet weak var incomeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonDesign(button: outcomeButton)
        buttonDesign(button: incomeButton)

    }
    
    func buttonDesign(button: UIButton) {
        button.layer.cornerRadius = 10.0;
        button.layer.masksToBounds = false;
        button.layer.borderWidth = 3.0;
        button.layer.borderColor = UIColor.systemBlue.cgColor


    }

    
}
