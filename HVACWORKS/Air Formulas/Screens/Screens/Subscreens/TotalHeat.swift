//
//  TotalHeat.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/27/21.
//

import SwiftUI

struct TotalHeat: View {
    @State private var showingDisclosure = false
    @State private var showingDisclosureInfo = false
    @State private var firstEntry = ""
    @State private var secondEntry = ""
    @State private var cfmValue = "0.0"
    @State private var answer = "0"
    
    @EnvironmentObject var storageProvider: StorageProvider
    
    
    let totalHeat = TotalHeatFormula()

    var body: some View {
        Group {
            VStack {
                FormulaHeaderView(showingDisclosure: $showingDisclosure, airFormula: .totalHeat, title: "Total Heat", subtitle: "Total heat is the total heat content of the air - the sum of both sensible and latent heat")
                NumberEntryView(firstEntry: $firstEntry, secondEntry: $secondEntry, selection: .constant(0), firstEntryPlaceHolder: "Enthalpy Difference ∆H", secondEntryPlaceHolder: "Cubic Feet per Minute", formula: .totalHeat, isLatentHeat: false, actionCode: addData) {
                    deleteData()
                }
                
                    .opacity(showingDisclosure || showingDisclosureInfo ? 0 : 1.0)
                Spacer()
                SimpleAnswerView(firstParam: "Total CFM", secondParam: "Total heat (BTUH)", firstOutput: (Double(cfmValue)?.withCommas()) ?? "0", secondOutput: answer, buttonLabel: "Find Total Heat")
            }
        }.contentShape(Rectangle())
        .onTapGesture {
            endEditing()
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    private func addData() {
        self.answer = totalHeat.totalHeat(cfm: firstEntry, deltaH: secondEntry).withCommas()
        totalHeat.persistValue(str: secondEntry) { value in
            self.cfmValue = value
            AppStoreReviewManager.requestReviewIfAppropriate()
        }
        self.storageProvider.saveFormula(.totalHeat, input: ["Enthalpy Difference", firstEntry, "Cubic Feet per Minute", secondEntry], output: answer)
        self.firstEntry = ""
        self.secondEntry = ""
        self.hideKeyboard()
    }
    private func deleteData() {
        self.firstEntry = ""
        self.secondEntry = ""
    }
}

struct TotalHeat_Previews: PreviewProvider {
    static var previews: some View {
        TotalHeat()
            .environmentObject(StorageProvider())
    }
}

extension Double {
    func withCommas() -> String {
    
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: self))
        guard let answer = formattedNumber else { return ""}
        return answer
    }
}
