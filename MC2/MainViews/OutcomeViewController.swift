//
//  OutcomeViewController.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 04/08/21.
//

import UIKit

class OutcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    let userDefault = UserDefaults.standard
    var items: [Despesas]?
    var soma: Double!
    var convert: Double!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDespesa()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = UIColor.white
        print (try! CoreDataStackDespesas.getDespesa())
        soma = userDefault.double(forKey: "totalDespesas")
    }
    
    func fetchDespesa() {
    
        // fetch the data from Core data to display in the table view
        do {
            self.items = try CoreDataStackDespesas.context.fetch(Despesas.fetchRequest())
    
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
    
        }
        catch{
    
        }
    
    }
    
    @IBAction func DidTapButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Adicionar Conta", message: "Insira o nome e o valor da conta", preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        
        let saveButton = UIAlertAction(title: "Salvar", style: .default) { (action) in
            
            let nameTextField = alert.textFields![0]
            let qtdTextField = alert.textFields![1]
            
            nameTextField.delegate = self
            qtdTextField.delegate = self
            
            if nameTextField.hasText == false || qtdTextField.hasText == false {
                
                let errorAlert = UIAlertController(title: "Erro!", message: "Informe o nome e o valor da conta respectivamente", preferredStyle: .alert)
                let okayButton = UIAlertAction(title: "Ok", style: .default) { (action) in
                    errorAlert.dismiss(animated: true, completion: nil)
                }
                errorAlert.addAction(okayButton)
                self.present(errorAlert, animated: true, completion: nil)
                
            } else {
                
                let convert = Double(qtdTextField.text!)!
                _ = try! CoreDataStackDespesas.createDespesa(nomeConta: nameTextField.text!, valor: convert)
                
                self.soma = self.soma + convert
                self.userDefault.setValue(self.soma, forKey: "totalDespesas")
                
                self.fetchDespesa()
           
            }
            
            
        }
        
        alert.addAction(saveButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
        
}

extension OutcomeViewController: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of items in the variable 'items
        guard let items = self.items else { return 0 }
        return items.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "OutcomeCell", for: indexPath) as! OutcomeTableViewCell
        let despesa = items?[indexPath.row]
        cell.nameOutcome.text = despesa?.nomeConta
        cell.valueOutcome.text = "Valor: \(String(describing: despesa!.valor))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = self.items![indexPath.row]
        let temp = self.items![indexPath.row].valor
        
        let alert = UIAlertController(title: "Editar Conta", message: "Insira o novo valor da conta", preferredStyle: .alert)
        alert.addTextField()
        
        let saveButton = UIAlertAction(title: "Salvar", style: .default) { (action) in
         
            let qtdTextField = alert.textFields![0]
            
            let newValue = Double(qtdTextField.text!) ?? 0
            product.valor = newValue
            
            self.soma = self.soma - temp
            self.soma = self.soma + newValue
            
            self.userDefault.setValue(self.soma, forKey: "totalDespesas")
        
            try! CoreDataStackDespesas.saveContextOutcome()
            
            
            
            self.fetchDespesa()
        }
        alert.addAction(saveButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       let temp = self.items![indexPath.row].valor
        if editingStyle == .delete {
            guard let item = items?[indexPath.row] else {return}
            do {
                try CoreDataStackDespesas.deleteDespesas(documentation: item)
                self.soma = self.soma - temp
                self.userDefault.setValue(self.soma, forKey: "totalDespesas")
            } catch {
                
            }
            fetchDespesa()
    }

    

    }
    
}
