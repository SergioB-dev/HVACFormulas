//
//  VariableEntryRowView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 3/1/21.
//

import SwiftUI

struct VariableEntryRowView: View {
    @ObservedObject var vm: ElectricViewModel
    @Binding var selectedElectricalUnit: CommonElectricalUnits?
    let variableToFind: CommonElectricalUnits
    let firstKnownVar: CommonElectricalUnits
    let secondKnownVar: CommonElectricalUnits
    var calculate: (Double, Double) -> Double {
        vm.chooseAppropriateCalculation(varToFind: variableToFind,
                                        firstKnownVar: firstKnownVar,
                                        secondKnownVar: secondKnownVar)
    }
    init(vm: ElectricViewModel, selectedElectricalUnit: Binding<CommonElectricalUnits?>) {
        
        self.vm = vm
        self._selectedElectricalUnit = selectedElectricalUnit
        // Setting the unit to be what was set in ElectricHeaderView
        self.variableToFind = vm.selectedElectricalUnit!
        
        // Finding out which variables are known
        
        var units = [Int]()
        
        for index in vm.selectedIntForButton {
            units.append(index)
        }
        
        func convertIndexIntoUnit(index: Int) -> CommonElectricalUnits {
             switch index {
             case 0:
                 return .amps
             case 1:
                 return .ohms
             case 2:
                 return .volts
             default:
                 return .watts
             }
         }

        self.firstKnownVar = convertIndexIntoUnit(index: units[0])
        self.secondKnownVar = convertIndexIntoUnit(index: units[1])

            }
    
    
    var body: some View {
        VStack {
            Group {
                TextField(firstKnownVar.rawValue, text: $vm.lhs)
                TextField(secondKnownVar.rawValue, text: $vm.rhs)
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numberPad)
            .frame(width: UIScreen.main.bounds.width * 0.6)
            Button(action: {performCalculation()}) {
                Text("Calculate").bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            if vm.answer != 0 {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.orange, .blue]), startPoint: .bottom, endPoint: .center)
                        .cornerRadius(10)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    VStack {
                        
                        Text(String(vm.answer)).bold()
                            .font(.custom("Times New Roman", size: 26))
                            .foregroundColor(.white)
                        Text(selectedElectricalUnit?.symbol ?? "")
                            .font(.custom("Times New Roman", size: 26))
                            .foregroundColor(.white)
                    }
                }.frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1)
            }
        }.padding()
    }
    private func performCalculation() {
        guard let lhsNumber = Double(vm.lhs),
             let rhsNumber = Double(vm.rhs) else { return }
        self.vm.answer = calculate(lhsNumber, rhsNumber)
        successVibrate()
        vm.lhs = ""
        vm.rhs = ""
        hideKeyboard()
        print(vm.answer)
        
    }
  
}

struct VariableEntryRowView_Previews: PreviewProvider {
    static var previews: some View {
       // VariableEntryRowView(vm: ElectricViewModel(), selectedElectricalUnit: .constant(.amps) )
        RadialGradient(gradient: Gradient(colors: [.blue, .orange]), center: .center, startRadius: 5, endRadius: 220).frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1)
    }
}
