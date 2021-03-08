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
                    Button(action: {
                        guard vm.stage.isEmpty else { return }
                        self.selectedElectricalUnit = unit
                        self.vm.selectedElectricalUnit = unit
                        withAnimation {
                            vm.stage.insert(.stage1)
                        }
                        successVibrate()
                    }){
                        Text(unit.rawValue)
                    }.buttonStyle(MyButtonStyle())
                    
                }
            }
        }
        
        .navigationBarItems(trailing: Button(action: {
            vm.stage.removeAll()
            vm.selectedIntForButton.removeAll()
            vm.answer = 0
            vm.selectedElectricalUnit = nil
            
        }){
            Text("Reset").opacity(vm.stage.isEmpty ? 0 : 1)
        })
        }
    }
