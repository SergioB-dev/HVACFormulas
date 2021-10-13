//
//  FormulaPersistenceScreen.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/4/21.
//

import SwiftUI
import CoreData

struct FormulaPersistenceScreen: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Formula.entity(), sortDescriptors: [], predicate: nil, animation: Animation.easeIn) var formulas: FetchedResults<Formula>
    var body: some View {
        List {
            Section(header: Text("Pinned")) {
                ForEach(formulas) { formula in
                        SavedFormulasListCell(formula: formula)
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

struct SavedFormulasListCell: View {
    @EnvironmentObject var storageProvider: StorageProvider
    let formula: Formula
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
                Text(formula.name?.formInitials() ?? "").bold()
                HStack {
                    VStack {
                        Text("Input").bold()
                        Rectangle()
                            .frame(width: 50, height: 2)
                        Text(formula.inputInitials(at: 0) ?? "").bold()
                    }
                    Spacer()
                    VStack {
                        Text("Output").bold()
                        Rectangle()
                            .frame(width: 50, height: 2)
                        Text(formula.output ?? "")
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .destructiveAction) {
                        Button(action: { }){
                            Image(systemName: "")
                        }
                    }
                }
            }.swipeActions {
                Button {
                    withAnimation(.spring()) {
                        storageProvider.deleteFormula(formula)
                    }
                } label: {
                    Image(systemName: "trash")
                }.tint(.red)
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
