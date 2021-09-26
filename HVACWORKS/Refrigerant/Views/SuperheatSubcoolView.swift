//
//  SuperheatSubcoolView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 5/6/21.
//

import SwiftUI

struct SuperheatSubcoolView: View {
    @State private var outdoorTemp = ""
    @State private var indoorTemp = ""
    @ObservedObject var superheatManager = SuperHeatManager()
    var width: CGFloat {
        UIScreen.main.bounds.width
    }
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Outdoor Dry Bulb").bold()
                        .foregroundColor(.red)
                    TextField("90º", text: $outdoorTemp)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()
                }
                VStack {
                    Text("Indoor Wet Bulb").bold()
                        .foregroundColor(.blue)
                    TextField("72º", text: $indoorTemp)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()
                }
            }
            showAnswer()
            HStack {
                Button(action: reset){
                    Text("Cancel").bold()
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .frame(maxWidth: width * 0.45)
                        .background(Color.red)
                        .cornerRadius(6)
                        .foregroundColor(.white)
                        
                }
                    
                Button(action:  calculate){
                    Image(systemName: "target")
                        
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .frame(maxWidth: width * 0.45)
                        .background(Color.blue)
                        .cornerRadius(6)
                    
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }

    private func reset() {
        DispatchQueue.main.async {
            self.outdoorTemp = ""
            self.indoorTemp = ""
            self.superheatManager.userSummonedAnswer = false
        }
    }
    
    private func calculate() {
        withAnimation {
            self.superheatManager.userSummonedAnswer = true
        }
        guard let oNumber = Double(outdoorTemp), let iNumber = Double(indoorTemp) else {
            return
        }
        self.superheatManager.findTargetSuperHeat(outdoor: oNumber, indoor: iNumber)
    }
    enum SaturationState {
        case superheat
        case subcool
    }
    
    @ViewBuilder private func showAnswer() -> some View {
        if superheatManager.userSummonedAnswer {
            Text("Desired Superheat 🔥 is: \(superheatManager.targetSuperheat)")
        }
    }
}

struct SuperheatSubcoolView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheatSubcoolView()
            
    }
}


