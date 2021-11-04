//
//  Formula+CoreDataProperties.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/6/21.
//
//

import Foundation
import CoreData


extension Formula {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Formula> {
        return NSFetchRequest<Formula>(entityName: "Formula")
    }

    @NSManaged public var date: Date?
    @NSManaged public var input: [String]?
    @NSManaged public var name: String?
    @NSManaged public var output: String?
    
    /// - Parameter index: Queries the input entries (every entry is expected to have at max 2 entries)
    /// - Returns: The initials for a given input title (ex. Temperature Difference -> TD)
    func inputInitials(at index: Int) -> String? {
        if let input = input {
            guard input.count > index else { return nil }
            let titleForFormula = input[index]
            return titleForFormula.formInitials()
        }
        return nil
    }
    


}

extension Formula : Identifiable {

}
