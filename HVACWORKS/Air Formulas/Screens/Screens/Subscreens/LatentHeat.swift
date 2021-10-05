//
//  LatentHeat.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/27/21.
//

import SwiftUI

struct LatentHeat: View {
    @State private var showingDisclosure = false
    @State private var showingDisclosureInfo = false
    @State private var firstEntry = ""
    @State private var secondEntry = ""
    @State private var selection = 0
    @State private var answer = "0"
    @State private var cfm = "0"
    
    let latentHeat = LatentHeatFormula()
    var placeholder: String {
        if selection == 0 {
            return "Humidity Ratio in lbs. of water"
        } else {
            return "Humidity Ration in grains of water"
        }
    }
            
    var body: some View {
        Group {
            VStack {
                FormulaHeaderView(showingDisclosure: $showingDisclosure, airFormula: .latentHeat, title: "Latent Heat", subtitle: "Latent is the heat involved in substances changing state as opposed to heat that is sensible")
                NumberEntryView(firstEntry: $firstEntry, secondEntry: $secondEntry, selection: $selection, firstEntryPlaceHolder: placeholder, secondEntryPlaceHolder: "Cubic Feet per Minute", formula: .latentHeat, isLatentHeat: true, actionCode: {
                    self.answer = latentHeat.latentHeat(selection: self.selection, variable: self.firstEntry, cfm: self.secondEntry)()
                    self.cfm = self.secondEntry
                    self.firstEntry = ""
                    self.secondEntry = ""
                    self.hideKeyboard()
                    AppStoreReviewManager.requestReviewIfAppropriate()
                }, destructiveActionCode: clearData).opacity(showingDisclosure || showingDisclosureInfo ? 0 : 1.0)
                Spacer()
                SimpleAnswerView(firstParam: "Total CFM", secondParam: "Latent Heat", firstOutput: cfm, secondOutput: answer, buttonLabel: "Find Latent Heat")
            }
        }
    }
    private func clearData() {
        self.firstEntry = ""
        self.secondEntry = ""
    }
}

struct LatentHeat_Previews: PreviewProvider {
    static var previews: some View {
        LatentHeat()
    }
}
