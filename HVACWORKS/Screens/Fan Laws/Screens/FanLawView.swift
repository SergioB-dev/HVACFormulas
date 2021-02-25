//
//  FanLawView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/18/21.
//

import SwiftUI

struct FanLawView: View {
    @State private var firstEntry = ""
    @State private var secondEntry = ""
    @State private var thirdEntry = ""
    @State private var firstAlternativeEntry = ""
    @State private var actionCode: () -> Void = { print("Hello") }
    @State private var showingDisclosure = false
    @State private var fanSelection: FanLawSelection = .fanLaw1
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(hue: 0.60, saturation: 0.80, brightness: 1, alpha: 1)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    
    var body: some View {
        VStack {
            FormulaHeaderView(showingDisclosure: $showingDisclosure, airFormula: .fanLaw, title: "Fan Law", subtitle: "How air movement is in proportion to other states")
            if !showingDisclosure {
                Group {
                    Picker(selection: $fanSelection.animation(), label: Text("Fan")) {
                        Text("Fan Law 1").tag(FanLawSelection.fanLaw1)
                        Text("Fan Law 2").tag(FanLawSelection.fanLaw2)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    FanLaw1EntryView(fanLaw: $fanSelection, firstEntry: $firstEntry, secondEntry: $secondEntry, thirdEntry: $thirdEntry, actionCode: $actionCode)
                    
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



