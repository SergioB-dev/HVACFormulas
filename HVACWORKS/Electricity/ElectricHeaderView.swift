//
//  ElectricHeaderView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/28/21.
//

import SwiftUI

struct ElectricHeaderView: View {
    @ObservedObject var vm: ElectricViewModel
    @Binding var selectedElectricalUnit: CommonElectricalUnits?
    var body: some View {
    
        VStack {
            Text("What do you want to find?")
                .headerView()
            HStack {
                ForEach(CommonElectricalUnits.allCases) { unit in
                    Button(action: {self.selectedElectricalUnit = unit
                        withAnimation {
                            vm.stage.insert(.stage1)
                        }
                    }){
                        
                        Text(unit.rawValue)
                    }.buttonStyle(MyButtonStyle())
                    
                }
                }
        }.navigationTitle("Electric Calculator ⚡️")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            vm.stage.removeAll()
            vm.selectedIntForButton.removeAll()
        }){
            Text("Reset").opacity(vm.stage.isEmpty ? 0 : 1)
        })
        }
    }
