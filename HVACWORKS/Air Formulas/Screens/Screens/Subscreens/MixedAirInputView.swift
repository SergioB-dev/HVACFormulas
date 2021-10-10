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
    let resetCode: () -> Void
    let actionCode: () -> Void
    
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
                HStack {
                    Spacer()
                    Button(action: resetCode){
                        Text("Reset").bold()
                            .padding()
                            .frame(height: 40)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(4.0)
                            .frame(height: 40)
                    }
                    Spacer()
                    Button(action: actionCode){
                        Text("Enter").bold()
                            .padding()
                            .frame(height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(4.0)
                            .frame(height: 40)
                    }
                    Spacer()
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                
            }.textFieldStyle(.roundedBorder)
        }.padding(.horizontal)
    }
}

struct MixedAirInputView_Previews: PreviewProvider {
    static var previews: some View {
        MixedAirInputView(isAnimated: .constant(true), temp: .constant("47"), cfm: .constant("23"), resetCode: {}, actionCode: {})
    }
}
