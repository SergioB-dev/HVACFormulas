//
//  FanLaw1EntryView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/19/21.
//

import SwiftUI
import Vision
/// Struct responsible for producing Fan Laws output data

struct FanLaw1EntryView: View {
    @ObservedObject var vm: FanLawViewModel
    @State private var buttonState: FanLaw1ButtonSelection = .cfm
    @Binding var fanLaw: FanLawSelection
    @Binding var firstEntry: String
    @Binding var secondEntry: String
    @Binding var calculatingSP: Bool
    ///For this calcualation, an alternative variable is needed. EX: If we have both CFM1 and CFM2 then we need one RPM variable, and if we have both RPMS then we need one CFM variable.
    @Binding var thirdEntry: String
    @State private var firstEntryPlaceHolder = "CFM1"
    @State private var secondEntryPlaceHolder = "CFM2"
    
    @State private var answer = ""

    var thirdEntryPlaceHolder: String {
        textSelection(fanLaw: fanLaw )
    }
    @Binding var actionCode: () -> Void
    var body: some View {
        VStack {
            
            VariableEntryView(vm: vm, fanLaw: $fanLaw, buttonState: $buttonState, firstEntryPlaceHolder: $firstEntryPlaceHolder, secondEntryPlaceHolder: $secondEntryPlaceHolder, firstEntry: $vm.firstEntry, secondEntry: $vm.secondEntry, thirdEntry: $vm.thirdEntry, answer: $vm.answer, calculatingSP: $calculatingSP)
            TextField(firstEntryPlaceHolder, text: $vm.firstEntry)
                .personalizeTextField()
            
            TextField(secondEntryPlaceHolder, text: $vm.secondEntry)
                .personalizeTextField()
            
            TextField(thirdEntryPlaceHolder, text: $vm.thirdEntry)
                .personalizeTextField()
            Spacer()
            if !vm.answer.isEmpty {
                HStack {
                    Text("\(thirdEntryPlaceHolder):").bold()
                        .padding(.trailing)
                    Text(vm.answer)
                }
            }
            Spacer()
            Button(action: {
                if fanLaw == .fanLaw1 {
                    self.vm.answer = vm.calculateFanLaw1(
                        firstEntry: vm.firstEntry,
                        secondEntry: vm.secondEntry,
                        rpm: vm.thirdEntry)
                    print(vm.firstEntry, vm.secondEntry, vm.thirdEntry, vm.answer)
                        clearAnswers()
                } else if fanLaw == .fanLaw2 {
                    self.vm.answer = vm.calculateFanLaw2(firstEntry: vm.firstEntry, secondEntry: vm.secondEntry, thirdEntry: vm.thirdEntry, fromCFMtoSP: true)
                }
                AppStoreReviewManager.requestReviewIfAppropriate()
                self.hideKeyboard()
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
    private func textSelection(fanLaw buttonState: FanLawSelection) -> String {
        switch buttonState {
        case .fanLaw1:
            return "CFM or RPM"
        case .fanLaw2:
            return "SP or CFM/RPM/HZ"
        }
    }
    private func clearAnswers() {
        self.vm.firstEntry = ""
        self.vm.secondEntry = ""
        self.vm.thirdEntry = ""
        
    }
}

struct FanLaw1EntryView_Previews: PreviewProvider {
    static var previews: some View {
        FanLaw1EntryView(vm: FanLawViewModel(), fanLaw: .constant(.fanLaw1), firstEntry: .constant("CFM"), secondEntry: .constant("RPM"), calculatingSP: .constant(false), thirdEntry: .constant("RPM"),
                         actionCode: .constant({ }))
    }
}

