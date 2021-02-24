//
//  FanLaw1EntryView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/19/21.
//

import SwiftUI
/// Struct responsible for producing Fan Laws output data

struct FanLaw1EntryView: View {
    @State private var buttonState: ButtonSelection = .cfm
    @Binding var firstEntry: String
    @Binding var secondEntry: String
    ///For this calcualation, an alternative variable is needed. EX: If we have both CFM1 and CFM2 then we need one RPM variable, and if we have both RPMS then we need one CFM variable.
    @Binding var thirdEntry: String
    @State private var firstEntryPlaceHolder = "CFM1"
    @State private var secondEntryPlaceHolder = "CFM2"
    var thirdEntryPlaceHolder: String {
        textSelection(cfmOrRpm: buttonState)
    }
    @Binding var actionCode: () -> Void
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        
                        self.buttonState = .cfm
                        self.firstEntryPlaceHolder = "CFM1"
                        self.secondEntryPlaceHolder = "CFM2"
                        successVibrate()
                            
                    }){
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
            TextField(firstEntryPlaceHolder, text: $firstEntry)
                .personalizeTextField()
            
            TextField(secondEntryPlaceHolder, text: $secondEntry)
                .personalizeTextField()
            
            TextField(thirdEntryPlaceHolder, text: $thirdEntry)
                .personalizeTextField()
            
                Button(action: { actionCode() }) {
                    Text("Enter")
                        .padding()
                        .frame(height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(4.0)
                        .frame(height: 40)
                }.buttonStyle(PlainButtonStyle())
                
               
            
            

            
        }
    }
    /// Changes placeholder text of Textfield to show appropriate entry.
    private func textSelection(cfmOrRpm buttonState: ButtonSelection) -> String {
        switch buttonState {
        case .cfm:
            return "RPM"
        case .rpm:
            return "CFM"
        }
    }
    
    private enum ButtonSelection {
        case cfm
        case rpm
    }
    
    private func successVibrate() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct FanLaw1EntryView_Previews: PreviewProvider {
    static var previews: some View {
        FanLaw1EntryView(firstEntry: .constant("CFM"), secondEntry: .constant("RPM"), thirdEntry: .constant("RPM"),
                         actionCode: .constant({ }))
    }
}
