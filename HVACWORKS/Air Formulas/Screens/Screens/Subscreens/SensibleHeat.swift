//
//  SensibleHeat.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/27/21.
//

import SwiftUI

struct SensibleHeat: View {
    @State private var showingDisclosure = false
    @State private var showingDisclosureInfo = false
    @State private var firstEntry = ""
    @State private var secondEntry = ""
    @State private var answer = "0"
    @State private var cfmFinal = "0"
    
    let sensibleHeat = SensibleHeatFormula()
    
    var body: some View {
        VStack {
            FormulaHeaderView(showingDisclosure: $showingDisclosure, airFormula: .sensibleHeat, title: "Sensible Heat", subtitle: "Sensible is the heat that can be perceived physically as opposed to Latent Heat")
            NumberEntryView(firstEntry: $firstEntry, secondEntry: $secondEntry, selection: .constant(0), firstEntryPlaceHolder: "Temperature difference ∆", secondEntryPlaceHolder: "Cubic Feet per Minute", isLatentHeat: false, actionCode: addData) {
                clearData()
            } .opacity(showingDisclosure || showingDisclosureInfo ? 0 : 1.0)
            Spacer()
            SimpleAnswerView(firstParam: "Total CFM", secondParam: "Sensible Heat (BTUH)", firstOutput: cfmFinal, secondOutput: answer, buttonLabel: "Get Sensible Heat")
        }
        
    }
    private func clearData() {
        self.firstEntry = ""
        self.secondEntry = ""
    }
    
    private func addData() {
        self.hideKeyboard()
        guard !firstEntry.isEmpty && !secondEntry.isEmpty else { return }
        self.answer = sensibleHeat.sensibleHeat(deltaT: firstEntry)
        sensibleHeat.cfmCalc(cfm: firstEntry) { value in
            self.cfmFinal = value
            AppStoreReviewManager.requestReviewIfAppropriate()
        }
        self.firstEntry = ""
        self.secondEntry = ""
        self.hideKeyboard()

    }
}

struct SensibleHeat_Previews: PreviewProvider {
    static var previews: some View {
        SensibleHeat()
    }
}
