//
//  SelectedVariableView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/28/21.
//

import SwiftUI

struct VariableSelectionView: View {
    @ObservedObject var vm: ElectricViewModel
    @Binding var selectedElectricUnit: CommonElectricalUnits?
    @Binding var buttonSelection: CommonElectricalUnits?
    @Binding var unit: CommonElectricalUnits?
    var body: some View {
        Group {
            if vm.stage.contains(.stage1) {
                VStack(alignment: .leading) {
                    Text("Which variables do you know").bold()
                        .padding(0)
                    Text("Must select two").foregroundColor(.secondary)
                        .font(.caption)
                }
                
                HStack {
                    ForEach(Array(zip(CommonElectricalUnits.allCases.indices,
                                      CommonElectricalUnits.allCases)),
                            id: \.0) { index, unit in
                        ElectricUnit(selectedElectricalUnit: $selectedElectricUnit,
                                     buttonSelection: $buttonSelection,
                                     vm: vm,
                                     unit: unit, index: index)
                        
                    }
                }
            }
            
        }.transition(.scale)
    }
}

