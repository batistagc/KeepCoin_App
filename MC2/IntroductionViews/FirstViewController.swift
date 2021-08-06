

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var head: UILabel!
    @IBOutlet weak var subhead: UILabel!
    @IBOutlet weak var restButton: UIButton!
    @IBOutlet weak var clothesButton: UIButton!
    @IBOutlet weak var serviceButton: UIButton!
    
    var type:String = ""
        
    override func viewDidLoad() {
        
        // setting the background color with a CAGradientLayer.
   
        
        
        head.textColor = UIColor.black
        subhead.textColor = UIColor.black
        
        buttonDesign(button: restButton)
        buttonDesign(button: clothesButton)
        buttonDesign(button: serviceButton)
        
        view.addSubview(head)
        view.addSubview(subhead)
        view.addSubview(restButton)
        view.addSubview(clothesButton)
        view.addSubview(serviceButton)

}
    
    @objc func didTapButton (_ sender: UIButton) {
        if sender == restButton {
            UserDefaults.standard.set("Restaurante", forKey: "atuacao")
        } else if sender == clothesButton{
            UserDefaults.standard.set("Roupas", forKey: "atuacao")
        } else if sender == serviceButton {
            UserDefaults.standard.set("Servicos", forKey: "atuacao")
        }
    }
    
    // applying some dropshadow in the UIbutton
    func buttonDesign(button: UIButton) {
        button.layer.cornerRadius = 10.0;
        button.layer.masksToBounds = false;
        button.layer.borderWidth = 3.0;
        button.layer.borderColor = UIColor.systemBlue.cgColor

    }
    


}
