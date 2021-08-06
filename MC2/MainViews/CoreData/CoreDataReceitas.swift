//
//  CoreDataReceitas.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 05/08/21.
//

import Foundation
import CoreData

class CoreDataStackReceitas {
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
    
    static func saveContextReceitas() throws{
        if context.hasChanges{
            try context.save()
        }
    }
    
    static func createReceita(nomeReceita: String, valorReceita: Double) throws -> Receitas{
        guard let receita = NSEntityDescription.insertNewObject(forEntityName: "Receitas", into: context) as? Receitas else {preconditionFailure()}
        receita.nomeReceita = nomeReceita
        receita.valorReceita = valorReceita
        try saveContextReceitas()
        return receita
    }
    
    static func getReceitas() throws -> [Receitas] {
        return try context.fetch(Receitas.fetchRequest())
    }
    
    static func deleteReceitas(documentation: Receitas) throws{
        context.delete(documentation)
        try saveContextReceitas()
    }
}
