//
//  Receitas+CoreDataProperties.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 05/08/21.
//
//

import Foundation
import CoreData


extension Receitas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Receitas> {
        return NSFetchRequest<Receitas>(entityName: "Receitas")
    }

    @NSManaged public var nomeReceita: String?
    @NSManaged public var valorReceita: Double

}

extension Receitas : Identifiable {

}
