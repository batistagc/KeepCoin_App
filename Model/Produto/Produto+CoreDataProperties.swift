//
//  Produto+CoreDataProperties.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 31/07/21.
//
//

import Foundation
import CoreData


extension Produto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Produto> {
        return NSFetchRequest<Produto>(entityName: "Produto")
    }

    @NSManaged public var nomeProduto: String?
    @NSManaged public var quantidade: Int64

}

extension Produto : Identifiable {

}
