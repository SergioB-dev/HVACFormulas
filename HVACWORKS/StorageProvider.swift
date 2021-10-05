//
//  StorageProvider.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/4/21.
//

import CoreData

class StorageProvider: ObservableObject {
    static let shared = StorageProvider()
    
    @Published var allFormulas: [Formula] = []
    @Published var shouldSaveAfterEveryCalculation = false
    
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
    
    func saveFormula(_ formulaType: Formulas) {
        let formula = Formula(context: persistentContainer.viewContext)
        formula.name = formulaType.rawValue
        formula.date = Date()
        
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
}

