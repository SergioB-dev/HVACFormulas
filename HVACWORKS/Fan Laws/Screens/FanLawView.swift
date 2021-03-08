//
//  FanLawView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/18/21.
//

import SwiftUI

struct FanLawView: View {
    @StateObject var vm = FanLawViewModel()
    @State private var firstAlternativeEntry = ""
    @State private var actionCode: () -> Void = { print("Hello") }
    @State private var showingDisclosure = false
    @State private var calculatingSP = false
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(hue: 0.60, saturation: 0.80, brightness: 1, alpha: 1)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    
    var body: some View {
        VStack {
            FormulaHeaderView(showingDisclosure: $showingDisclosure, airFormula: .fanLaw, title: "Fan Law", subtitle: "Laws governing CFM, RPM, Hertz, Static Pressure")
            if !showingDisclosure {
                Group {
                    Picker(selection: $vm.fanLawSelection.animation(), label: Text("Fan")) {
                        Text("Fan Law 1").tag(FanLawSelection.fanLaw1)
                        Text("Fan Law 2").tag(FanLawSelection.fanLaw2)
                    }.pickerStyle(SegmentedPickerStyle())
                    FanLaw1EntryView(vm: vm, fanLaw: $vm.fanLawSelection, firstEntry: $vm.firstEntry, secondEntry: $vm.secondEntry, calculatingSP: $calculatingSP, thirdEntry: $vm.thirdEntry, actionCode: $actionCode)
                }
            }
            Spacer()
        }
    }
  
}

struct FanLawView_Previews: PreviewProvider {
    static var previews: some View {
        FanLawView()
    }
}


//MARK:- TODO: Fix this and continue to make FanLawView dynamic using this ViewBuilder



