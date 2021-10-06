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
        List {
            Section(header: Text("Pinned")) {
                ForEach(formulas) { formula in
                    if #available(iOS 15.0, *) {
                        VStack {
                            HStack {
                                Text(formula.name ?? "Nothing to see here")
                                Spacer()
                                    Text(formula.date?.formatted(date: .numeric, time: .omitted) ?? "No date")
                              
                            }.swipeActions {
                                Button {
                                    withAnimation(.spring()) {
                                    storageProvider.deleteFormula(formula)
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }.tint(.red)
                                
                        }
                            Text(formula.input?[0] ?? "Nothing to see")
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
        }
    }
    
}

struct FormulaPersistenceScreen_Previews: PreviewProvider {
    static var previews: some View {
        FormulaPersistenceScreen()
            .environmentObject(StorageProvider())
    }
}
