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
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                            self.secondButtonState = .cfm
                            self.firstEntryPlaceHolder = "CFM1"
                            self.secondEntryPlaceHolder = "CFM2"
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
            }.padding()
        }
    }
}


struct VariableEntryView_Previews: PreviewProvider {
    static var previews: some View {
        VariableEntryView(fanLaw: .constant(.fanLaw1), buttonState: .constant(.cfm), firstEntryPlaceHolder: .constant("Hello"), secondEntryPlaceHolder: .constant("Bye"))
    }
}


