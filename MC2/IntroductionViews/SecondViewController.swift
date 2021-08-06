//
//  SecondViewController.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 26/07/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var head: UILabel!
    @IBOutlet weak var subHead: UILabel!
    @IBOutlet weak var store: UIButton!
    @IBOutlet weak var digital: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting the background color with a CAGradientLayer.

        
        
        head.textColor = UIColor.black
        subHead.textColor = UIColor.black
        
        buttonDesign(button: store)
        buttonDesign(button: digital)
    
        
        view.addSubview(head)
        view.addSubview(subHead)
        view.addSubview(store)
        view.addSubview(digital)

    }
    
    func buttonDesign(button: UIButton) {
        button.layer.cornerRadius = 10.0;
        button.layer.masksToBounds = false;
        button.layer.borderWidth = 3.0;
        button.layer.borderColor = UIColor.systemBlue.cgColor


    }
    
    @objc func DidTapButton(_ sender: UIButton!) {
        if sender == store {
            UserDefaults.standard.set("fisico", forKey: "tipo")
        } else if sender == digital{
            UserDefaults.standard.set("digital", forKey: "tipo")
        }
    }


}
