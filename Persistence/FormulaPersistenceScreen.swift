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
        VStack {
            List {
                Section(header: Text("Pinned")) {
                    ForEach(formulas) { formula in
                            SavedFormulasListCell(formula: formula)
                    }
                }
            }
            ZStack {
                Rectangle()
                    .stroke(.black, lineWidth: 1)
                    .padding()
                VStack {
                    Text("LEGEND")
                        .bold()
                    ForEach(AirFormulaCases.allCases, id: \.self) { airFormula in
                        HStack {
                            Image(systemName: airFormula.legendSymbol)
                                .foregroundColor(airFormula.legendSymbolColor)
                                .padding(.leading, 50)
                                .padding(.vertical, 2)
                                .frame(width: 50)
                            Text("    - ")
                            Text(airFormula.rawValue)
                            Spacer()
                            
                        }
                    }
                }
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.25)
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
                Image(systemName: imagify(formula.name))
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
    private func imagify(_ name: String?) -> String {
//    case mixedAirTemp = "Mixed Air Temperature"
//    case sensibleHeat = "Sensible Heat"
//    case latentHeat = "Latent Heat"
//    case totalHeat = "Total Heat"
        switch name {
        case "Mixed Air Temperature":
            return "wind"
        default:
            return "flame"
        }
    }

}
