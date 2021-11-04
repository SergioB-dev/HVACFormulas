//
//  StorageProvider.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/4/21.
//

import CoreData
import SwiftUI

class StorageProvider: ObservableObject {
    static let shared = StorageProvider()
    @Published var allFormulas: [Formula] = []

    var saveStatus: Bool {
        UserDefaults.standard.bool(forKey: "saveStatus")
    }
    
    let persistentContainer: NSPersistentContainer
    
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Formulas")
        
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load persistent stores \(error)")
            }
        }
        
        self.allFormulas = self.getAllFormulas()
    }
    
    func saveFormula(_ formulaType: Formulas, input: [String], output: String) {
        guard saveStatus else { return }
        let formula = Formula(context: persistentContainer.viewContext)
        formula.name = formulaType.rawValue
        formula.date = Date()
        formula.input = input
        formula.output = output
        
        do {
            try persistentContainer.viewContext.save()
            print("Formula saved successfully")
        } catch {
            print("Failed to save formula: \(error)")
        }
    }
    
    func getAllFormulas() -> [Formula] {
        let fetchRequest: NSFetchRequest<Formula> = Formula.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch movies: \(error)")
            return []
        }
    }
    
    func deleteFormula(_ formula: Formula) {
        persistentContainer.viewContext.delete(formula)
        do {
           try persistentContainer.viewContext.save()
        } catch {
            print("Could not delete item: \(error)")
        }
    }
}

