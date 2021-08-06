//
//  Despesas+CoreDataProperties.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 05/08/21.
//
//

import Foundation
import CoreData


extension Despesas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Despesas> {
        return NSFetchRequest<Despesas>(entityName: "Despesas")
    }

    @NSManaged public var nomeConta: String?
    @NSManaged public var valor: Double

}

extension Despesas : Identifiable {

}
