//
//  StockViewController.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 30/07/21.
//

import UIKit
import CoreData

class StockViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    

    @IBOutlet weak var stock: UILabel!
    
        
    var items: [Produto]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchProduct()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = UIColor.white
        print (try! CoreDataStackProduto.getProduto())

    }
    
    func fetchProduct() {
    
        // fetch the data from Core data to display in the table view
        do {
            self.items = try CoreDataStackProduto.context.fetch(Produto.fetchRequest())
    
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
    
        }
        catch{
    
        }
    
    }
    
    
    @IBAction func DidTapButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Adicionar Produto", message: "Insira o nome e quantidade do produto", preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        
        let saveButton = UIAlertAction(title: "Salvar", style: .default) { (action) in
            
            let nameTextField = alert.textFields![0]
            let qtdTextField = alert.textFields![1]
            
            nameTextField.delegate = self
            qtdTextField.delegate = self
            
            if nameTextField.hasText == false || qtdTextField.hasText == false {
                
                let errorAlert = UIAlertController(title: "Erro!", message: "Informe o nome e quantidade do produto respectivamente", preferredStyle: .alert)
                let okayButton = UIAlertAction(title: "Ok", style: .default) { (action) in
                    errorAlert.dismiss(animated: true, completion: nil)
                }
                errorAlert.addAction(okayButton)
                self.present(errorAlert, animated: true, completion: nil)
                
            } else {
                _ = try! CoreDataStackProduto.createProduto(nomeProduto: nameTextField.text!, quantidade: Int64(qtdTextField.text!)!)
                
                self.fetchProduct()
           
            }
            
            
        }
        
        alert.addAction(saveButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
        
}
    


extension StockViewController: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of items in the variable 'items'
        guard let items = self.items else { return 0 }
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        let product = items?[indexPath.row]
        cell.productName.text = product?.nomeProduto
        cell.productQt.text = "Qtd: \(String(describing: product!.quantidade))"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = self.items![indexPath.row]
        
        let alert = UIAlertController(title: "Editar Produto", message: "Insira a nova quantidade do produto", preferredStyle: .alert)
        alert.addTextField()
        
        let saveButton = UIAlertAction(title: "Salvar", style: .default) { (action) in
         
            let qtdTextField = alert.textFields![0]
            
            product.quantidade = Int64(qtdTextField.text!) ?? 0
            
        
            try! CoreDataStackProduto.saveContext()
            
            
            self.fetchProduct()
        }
        alert.addAction(saveButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let item = items?[indexPath.row] else {return}
            do {
                try CoreDataStackProduto.deleteProduto(documentation: item)
            } catch {
                
            }
            fetchProduct()
    }
}
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
    

}
