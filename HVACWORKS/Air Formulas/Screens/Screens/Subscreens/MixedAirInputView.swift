//
//  MixedAirInputView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/9/21.
//

import SwiftUI

struct MixedAirInputView: View {
    @Binding var isAnimated: Bool
    @Binding var temp: String
    @Binding var cfm: String
    
    var body: some View {
        VStack{
            if isAnimated {
                Text("Step 1: Enter entries").bold()
                Text("At least 2 entries")
                    .font(.caption)
            }
            // This button breaks the template because the template button saves on tap. That is not appropriate for this view.
            
            //                                NumberEntryView(firstEntry: $temp, secondEntry: $cfm, selection: .constant(0), firstEntryPlaceHolder: "Temperature (Fº)", secondEntryPlaceHolder: "Cubic Feet / Minute",formula: .mixedAirTemp, isLatentHeat: false,
            //                                                actionCode: { increment()
            //                                                self.hideKeyboard()}) {
            //                                    clearData()
            //                                }
            Group {
                
                TextField("Temp", text: $temp)
                TextField("CFM", text: $cfm)
            }.textFieldStyle(.roundedBorder)
        }.padding(.horizontal)
    }
}

struct MixedAirInputView_Previews: PreviewProvider {
    static var previews: some View {
        MixedAirInputView(isAnimated: .constant(true), temp: .constant("47"), cfm: .constant("23"))
    }
}
