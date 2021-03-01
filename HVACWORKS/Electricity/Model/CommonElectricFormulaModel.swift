//
//  CommonElectricFormulaModel.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/28/21.
//

import SwiftUI

struct ElectricUnit: View, Identifiable  {
    @State private var borderOn = false
    @Binding var selectedElectricalUnit: CommonElectricalUnits?
    @Binding var buttonSelection: CommonElectricalUnits?
    @ObservedObject var vm: ElectricViewModel
    
    let id = UUID()
    let unit: CommonElectricalUnits
    let index: Int
    
    
    
    var body: some View {
        Button(action: {
            print("Inserting \(unit)")
            print("Button is not disabled")
            toggleButtonBorder(border: borderOn)
        }){
            Text(unit.rawValue)
        }.disabled(disableButton())
        .buttonStyle(SecondaryButton(
                        vm: vm,
                        unit: $buttonSelection,
                        index: index,
                        disabled: disableButton()))
    }
    private func disableButton() -> Bool {
        selectedElectricalUnit == unit
    }
    
    private func toggleButtonBorder(border isAlreadyOn: Bool) {
        
        if isAlreadyOn {
                vm.selectedIntForButton.remove(index)
        } else {
            guard vm.selectedIntForButton.count < 2 else { return }
                vm.selectedIntForButton.insert(index)
        }
        borderOn.toggle()
        }
    
}
