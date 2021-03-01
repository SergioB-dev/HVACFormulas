//
//  MultiEntryElectricView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/28/21.
//

import SwiftUI

struct MultiEntryElectricView: View {
    @StateObject var vm = ElectricViewModel()
    @State private var selectedElectricUnit: CommonElectricalUnits? = nil
    @State private var disabledElectricUnit: CommonElectricalUnits?
    @State private var buttonSelection: CommonElectricalUnits?
    var body: some View {
        VStack  {
            ElectricHeaderView(vm: vm, selectedElectricalUnit: $selectedElectricUnit)
                .padding(.bottom)
            
            VariableSelectionView(vm: vm, selectedElectricUnit: $selectedElectricUnit, buttonSelection: $buttonSelection, unit: $buttonSelection)
            Spacer()
        }
    }
//    private enum Stage {
//        case stage1
//        case stage2
//        case stage3
//        case stage4
//    }
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
}







