//
//  CoreDataDespesas.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 05/08/21.
//

import Foundation

import CoreData

class CoreDataStackDespesas {
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MC2")
        container.loadPersistentStores { _, error in
            if let erro = error{
                preconditionFailure(erro.localizedDescription)
            }
            
        }
        return container
    }()
    
    static var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    static func saveContextOutcome() throws{
        if context.hasChanges{
            try context.save()
        }
    }
    
    static func createDespesa(nomeConta: String, valor: Double) throws -> Despesas{
        guard let despesa = NSEntityDescription.insertNewObject(forEntityName: "Despesas", into: context) as? Despesas else {preconditionFailure()}
        despesa.nomeConta = nomeConta
        despesa.valor = valor
        try saveContextOutcome()
        return despesa
    }
    
    static func getDespesa() throws -> [Despesas] {
        return try context.fetch(Despesas.fetchRequest())
    }
    
    static func deleteDespesas(documentation: Despesas) throws{
        context.delete(documentation)
        try saveContextOutcome()
    }
}
