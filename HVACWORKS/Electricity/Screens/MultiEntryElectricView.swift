//
//  MultiEntryElectricView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/28/21.
//

import SwiftUI

struct MultiEntryElectricView: View {
    @State private var lhs = ""
    @State private var rhs = ""
    @StateObject var vm = ElectricViewModel()
    @State private var selectedElectricUnit: CommonElectricalUnits? = nil
    @State private var disabledElectricUnit: CommonElectricalUnits?
    @State private var buttonSelection: CommonElectricalUnits?
    var body: some View {
        Group {
            VStack  {
                ElectricHeaderView(vm: vm, selectedElectricalUnit: $selectedElectricUnit)
                    .padding(.bottom)
                
                VariableSelectionView(vm: vm, selectedElectricUnit: $selectedElectricUnit, buttonSelection: $buttonSelection, unit: $buttonSelection)
               showRows()
            
                Spacer()
            }
        }.contentShape(Rectangle())
        .onTapGesture {
            endEditing()
        }
    }
    private func endEditing() {
        UIApplication.shared.endEditing()
    }

    @ViewBuilder func showRows() -> some View {
        if vm.selectedIntForButton.count > 1 {
            VariableEntryRowView(vm: vm, selectedElectricalUnit: $selectedElectricUnit)
        } 
    }
}

struct MultiEntryElectricView_Previews: PreviewProvider {
    static var previews: some View {
        MultiEntryElectricView()
    }
}

enum CommonElectricalUnits: String, CaseIterable, Identifiable {
    case amps = "Amps"
    case ohms = "Ohms"
    case volts = "Volts"
    case watts = "Watts"
    
    var id: String {
        self.rawValue
    }
    
    var symbol: String {
        switch self {
        case .amps:
            return "A"
        case .ohms:
            return "Ω"
        case .volts:
            return "V"
        case .watts:
            return "W"
        }
    }
}







