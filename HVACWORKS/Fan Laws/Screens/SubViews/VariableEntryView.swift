//
//  VariableEntryView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/24/21.
//

import SwiftUI

struct VariableEntryView: View {
    @State private var secondButtonState: FanLaw2ButtonSelection = .cfm
    @Binding var fanLaw: FanLawSelection
    @Binding var buttonState: FanLaw1ButtonSelection
    @Binding var firstEntryPlaceHolder: String
    @Binding var secondEntryPlaceHolder: String
    @Binding var firstEntry: String
    @Binding var secondEntry: String
    @Binding var thirdEntry: String
    @Binding var answer: String
    @Binding var calculatingSP: Bool
    var body: some View {
        showEntries().transition(.identity)
    }
    @ViewBuilder private func showEntries() -> some View {
        switch fanLaw {
        case .fanLaw1:
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                            self.buttonState = .cfm
                            self.firstEntryPlaceHolder = "CFM1"
                            self.secondEntryPlaceHolder = "CFM2"
                            resetEntries()
                            successVibrate()}){
                        Image(systemName: buttonState == .cfm ? "checkmark.square.fill" : "square")
                            .imageScale(.large)
                            .padding([.horizontal, .top] )
                    }
                    Text("CFM")
                        .padding(.top, 5)
                }
                Spacer()
                VStack {
                    Button(action: {
                        self.buttonState = .rpm
                        self.firstEntryPlaceHolder = "RPM1"
                        self.secondEntryPlaceHolder = "RPM2"
                        resetEntries()
                        successVibrate()
                    }){
                        Image(systemName: buttonState == .cfm ? "square" : "checkmark.square.fill")
                            .imageScale(.large)
                            .padding([.horizontal, .top] )
                    }
                    Text("RPM")
                        .padding(.top, 5)
                }
                Spacer()
            }.padding()
        case .fanLaw2:
            Group {
                
                    HStack {
                        
                        Spacer()
                        Group {
                            VStack {
                                Button(action: {
                                        self.secondButtonState = .cfm
                                        self.firstEntryPlaceHolder = "CFM1"
                                        self.secondEntryPlaceHolder = "CFM2"
                                        self.calculatingSP = false
                                        resetEntries()
                                        successVibrate()}){
                                    Image(systemName: secondButtonState == .cfm ? "checkmark.square.fill" : "square")
                                        .imageScale(.large)
                                        .padding([.horizontal, .top] )
                                }
                                Text("CFM")
                                    .padding(.top, 5)
                            }
                            Spacer()
                            VStack {
                                Button(action: {
                                    self.secondButtonState = .rpm
                                    self.firstEntryPlaceHolder = "RPM1"
                                    self.secondEntryPlaceHolder = "RPM2"
                                    self.calculatingSP = false
                                    resetEntries()
                                    successVibrate()
                                }){
                                    Image(systemName: secondButtonState == .rpm ? "checkmark.square.fill" : "square")
                                        .imageScale(.large)
                                        .padding([.horizontal, .top] )
                                }
                                Text("RPM")
                                    .padding(.top, 5)
                                
                            }
                            Spacer()
                            VStack {
                                Button(action: {
                                    self.secondButtonState = .hertz
                                    self.firstEntryPlaceHolder = "HZ1"
                                    self.secondEntryPlaceHolder = "HZ2"
                                    self.calculatingSP = false
                                    successVibrate()
                                }){
                                    Image(systemName: secondButtonState == .hertz ? "checkmark.square.fill" : "square")
                                        .imageScale(.large)
                                        .padding([.horizontal, .top] )
                                }
                                Text("Hertz")
                                    .padding(.top, 5)
                                
                            }
                            Spacer()
                            VStack {
                                Button(action: {
                                    self.secondButtonState = .staticPressure
                                    self.firstEntryPlaceHolder = "SP1"
                                    self.secondEntryPlaceHolder = "SP2"
                                    self.calculatingSP = true
                                    successVibrate()
                                }){
                                    Image(systemName: secondButtonState == .staticPressure ? "checkmark.square.fill" : "square")
                                        .imageScale(.large)
                                        .padding([.horizontal, .top] )
                                }
                                Text("SP")
                                    .padding(.top, 5)
                                
                            }
                        }
                        
                        Spacer()
                        
                    }.padding()
                
            }
        }
    }
    private func resetEntries() {
        guard !answer.isEmpty else { return }
            self.firstEntry = ""
            self.secondEntry = ""
            self.thirdEntry = ""
            self.answer = ""
        
    }
}


struct VariableEntryView_Previews: PreviewProvider {
    static var previews: some View {
        VariableEntryView(fanLaw: .constant(.fanLaw1), buttonState: .constant(.cfm), firstEntryPlaceHolder: .constant("Hello"), secondEntryPlaceHolder: .constant("Bye"), firstEntry: .constant("123"), secondEntry: .constant("345"), thirdEntry: .constant("678"), answer: .constant("0"), calculatingSP: .constant(false))
    }
}


