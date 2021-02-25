//
//  FanLaw1EntryView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/19/21.
//

import SwiftUI
/// Struct responsible for producing Fan Laws output data

struct FanLaw1EntryView: View {
    @State private var buttonState: FanLaw1ButtonSelection = .cfm
    @Binding var fanLaw: FanLawSelection
    @Binding var firstEntry: String
    @Binding var secondEntry: String
    ///For this calcualation, an alternative variable is needed. EX: If we have both CFM1 and CFM2 then we need one RPM variable, and if we have both RPMS then we need one CFM variable.
    @Binding var thirdEntry: String
    @State private var firstEntryPlaceHolder = "CFM1"
    @State private var secondEntryPlaceHolder = "CFM2"
    @State private var answer = ""
    
    let vm = FanLawViewModel()
    var thirdEntryPlaceHolder: String {
        textSelection(cfmOrRpm: buttonState)
    }
    @Binding var actionCode: () -> Void
    var body: some View {
        VStack {
            
            VariableEntryView(fanLaw: $fanLaw, buttonState: $buttonState, firstEntryPlaceHolder: $firstEntryPlaceHolder, secondEntryPlaceHolder: $secondEntryPlaceHolder)
            TextField(firstEntryPlaceHolder, text: $firstEntry)
                .personalizeTextField()
            
            TextField(secondEntryPlaceHolder, text: $secondEntry)
                .personalizeTextField()
            
            TextField(thirdEntryPlaceHolder, text: $thirdEntry)
                .personalizeTextField()
            Spacer()
            if !answer.isEmpty {
                HStack {
                    Text("\(thirdEntryPlaceHolder):").bold()
                        .padding(.trailing)
                    Text(answer)
                }
            }
            Spacer()
            Button(action: {
                    self.answer = vm.calculateFanLaw1(
                        firstEntry: firstEntry,
                        secondEntry: secondEntry,
                        rpm: thirdEntry)
                print(firstEntry, secondEntry, thirdEntry, answer)
                        clearAnswers()
                AppStoreReviewManager.requestReviewIfAppropriate()
            }) {
                    Text("Enter")
                        .padding()
                        .frame(width: 100, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(4.0)
                }.buttonStyle(PlainButtonStyle())
        }
    }
    /// Changes placeholder text of Textfield to show appropriate entry.
    private func textSelection(cfmOrRpm buttonState: FanLaw1ButtonSelection) -> String {
        switch buttonState {
        case .cfm:
            return "RPM"
        case .rpm:
            return "CFM"
        }
    }
    private func clearAnswers() {
        self.firstEntry = ""
        self.secondEntry = ""
        self.thirdEntry = ""
    }
}

struct FanLaw1EntryView_Previews: PreviewProvider {
    static var previews: some View {
        FanLaw1EntryView(fanLaw: .constant(.fanLaw1), firstEntry: .constant("CFM"), secondEntry: .constant("RPM"), thirdEntry: .constant("RPM"),
                         actionCode: .constant({ }))
    }
}

