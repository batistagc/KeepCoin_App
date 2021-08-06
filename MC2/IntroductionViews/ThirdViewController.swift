//
//  ThirdViewController.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 26/07/21.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var head: UILabel!
    @IBOutlet weak var foward: UIButton!
    @IBOutlet weak var userField: UITextField!
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        
        head.textColor = UIColor.black
        buttonDesign(textField: userField)
        userField.delegate = self
        userField.attributedPlaceholder = NSAttributedString( string: " 'Meu negócio' ",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        foward.layer.cornerRadius = 43.0
        foward.tintColor = UIColor.white
        foward.setTitleColor(.white, for: .normal)
        foward.isHidden = true
        
        
        
        
        view.addSubview(head)
        view.addSubview(userField)
        view.addSubview(foward)
    }
    
    @IBAction func checkText(_ sender: Any) {
        if userField.hasText{foward.isHidden = false}
        else{
            foward.isHidden = true
        }
    }
    
    func buttonDesign(textField: UITextField) {
        textField.layer.cornerRadius = 10.0;
        textField.layer.masksToBounds = false;
        textField.layer.borderWidth = 3.0
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.borderStyle = .roundedRect
    }
    
    @IBAction func DidTapButton(_ sender: Any) {
        userDefaults.set(userField.text, forKey: "nomeNegocio")
    }
    
}

extension ThirdViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
    
}
