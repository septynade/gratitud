//
//  Entry+CoreDataProperties.swift
//  hamdalah
//
//  Created by midn1ght on 1/8/21.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var date: Date
    @NSManaged public var text: String

}

extension Entry : Identifiable {

}
