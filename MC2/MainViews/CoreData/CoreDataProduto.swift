//
//  CoreDataProduto.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 03/08/21.
//

import Foundation

import CoreData

class CoreDataStackProduto {
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
    
    static func saveContext() throws{
        if context.hasChanges{
            try context.save()
        }
    }
    
    static func createProduto(nomeProduto: String, quantidade: Int64) throws -> Produto{
        guard let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context) as? Produto else {preconditionFailure()}
        produto.nomeProduto = nomeProduto
        produto.quantidade = quantidade
        try saveContext()
        return produto
    }
    
    static func getProduto() throws -> [Produto] {
        return try context.fetch(Produto.fetchRequest())
    }
    
    static func deleteProduto(documentation: Produto) throws{
        context.delete(documentation)
        try saveContext()
    }
}
