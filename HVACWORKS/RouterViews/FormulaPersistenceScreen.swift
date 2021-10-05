//
//  FormulaPersistenceScreen.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/4/21.
//

import SwiftUI
import CoreData

struct FormulaPersistenceScreen: View {
    @EnvironmentObject var storageProvider: StorageProvider
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Formula.entity(), sortDescriptors: [], predicate: nil, animation: Animation.easeIn) var formulas: FetchedResults<Formula>
    var body: some View {
        List(formulas) { formula in
            Text(formula.name ?? "Nothing to see here")
        }
    }
}

struct FormulaPersistenceScreen_Previews: PreviewProvider {
    static var previews: some View {
        FormulaPersistenceScreen()
            .environmentObject(StorageProvider())
    }
}
