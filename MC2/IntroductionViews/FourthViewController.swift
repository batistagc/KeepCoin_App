
//  Created by Gabriel Batista Cristiano on 27/07/21.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var head: UILabel!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var foward: UIButton!
    var amount: Int = 0
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        head.textColor = UIColor.black
        buttonDesign(textField: userField)
        userField.delegate = self
        userField.attributedPlaceholder = NSAttributedString( string: " R$ 0,00 ",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        userField.placeholder = updateAMount()
        
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
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userField.resignFirstResponder()
    }
    
    func updateAMount() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        let amt = Double(amount/100) + Double(amount%100)/100
        return formatter.string(from: NSNumber(value: amt))
    }
    
    func buttonDesign(textField: UITextField) {
        textField.layer.cornerRadius = 10.0;
        textField.layer.masksToBounds = false;
        textField.layer.borderWidth = 3.0
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.borderStyle = .roundedRect
    }
    
    @IBAction func DidTapButton(_ sender: Any) {
        userDefaults.set(userField.text, forKey: "capital")
    }
    
}

extension FourthViewController : UITextFieldDelegate {
      func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let digit = Int(string) {
            amount = amount * 10 + digit
            userField.text = updateAMount()
        }
        if string == ""{
            amount = amount/10
            userField.text = updateAMount()
        }
        return false
    }
    
    
}

