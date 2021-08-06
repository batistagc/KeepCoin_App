//
//  PainelViewController.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 27/07/21.
//

import UIKit

class PainelViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var outcomeView: UIView!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var outcome: UILabel!
    @IBOutlet weak var income: UILabel!
    @IBOutlet weak var outcomeTitle: UILabel!
    @IBOutlet weak var incomeTitle: UILabel!
    let userDefault = UserDefaults.standard
    let imagesSet = [
        UIImage(named: "primeiros-passos")!,
        UIImage(named: "financas")!,
        UIImage(named: "análise")!,
        UIImage(named: "marketing")!,
    ]
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel?.text = userDefault.string(forKey: "nomeNegocio")
        capitalLabel?.text = userDefault.string(forKey: "capital")
        let despesa = userDefault.double(forKey: "totalDespesas")
        outcome.text = "R$ \(String(despesa))"
        
        let receita = userDefault.double(forKey: "totalReceitas")
        income.text = "R$ \(String(receita))"
        
        outcomeView.layer.cornerRadius = 10.0
        
        navigationController?.navigationBar.isHidden = true
        

    }
    


}

extension PainelViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "check", for: indexPath) as? lessonCollectionViewCell
        
        // setting the lesons cards title
        switch indexPath.row {
        case 0:
            cell?.lessonNumber.text = "Primeiros Passos"
            cell?.thumbImage.image = imagesSet[indexPath.item]
            cell?.layer.cornerRadius = 10.0
            cell?.layer.borderWidth = 3.0
            cell?.layer.borderColor = UIColor.systemBlue.cgColor
        case 1:
            cell?.lessonNumber.text = "Organizando as finanças"
            cell?.thumbImage.image = imagesSet[indexPath.item]
            cell?.layer.cornerRadius = 10.0
            cell?.layer.borderWidth = 3.0
            cell?.layer.borderColor = UIColor.systemBlue.cgColor
        case 2:
            cell?.lessonNumber.text = "Análises"
            cell?.thumbImage.image = imagesSet[indexPath.item]
            cell?.layer.cornerRadius = 10.0
            cell?.layer.borderWidth = 3.0
            cell?.layer.borderColor = UIColor.systemBlue.cgColor
        case 3:
            cell?.lessonNumber.text = "Marketing"
            cell?.thumbImage.image = imagesSet[indexPath.item]
            cell?.layer.cornerRadius = 10.0
            cell?.layer.borderWidth = 3.0
            cell?.layer.borderColor = UIColor.systemBlue.cgColor
        default:
            cell?.lessonNumber.text = ""
        }
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            performSegue(withIdentifier: "primeiro", sender: indexPath.row)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "financas", sender: indexPath.row)
        } else if indexPath.row == 2 {
            performSegue(withIdentifier: "analise", sender: indexPath.row)
        } else if indexPath.row == 3 {
            performSegue(withIdentifier: "marketing", sender: indexPath.row)
        }
    }
    

    
    @objc func buttonAction(sender: UIButton!) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "SecondController") as! SecondViewController
        self.present(controller, animated: true, completion: nil)
    }
    
    
}
