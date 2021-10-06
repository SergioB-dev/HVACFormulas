//
//  SaveButton.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/5/21.
//

import SwiftUI


/// A Button that displays in its upper right hand corner a light that will either be lit or not.
///
/// If it is lit then this signifies that the user opts to save every math equation this app performs.
///

struct SaveButton: View {

    @EnvironmentObject var storageProvider: StorageProvider

    
    /// Something about this button
    ///
    var plainButton = false
    let displayLabel: String
    let formulaType: Formulas
    var width: CGFloat = UIScreen.main.bounds.width * 0.6
    var height: CGFloat = 76
    var cornRadius: CGFloat = 10
    let input: [String]
    let output: String
    let action: () -> Void
    var body: some View {
        saveButton()
    }
    
    @ViewBuilder private func saveButton() -> some View {
        if plainButton {
            Button(action: {
                action()
                saveFormula()
            }) {
                Text("Enter").bold()
                    .padding()
                    .frame(height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(4.0)
            }.buttonStyle(PlainButtonStyle())
        } else {
            if #available(iOS 15.0, *) {
                ZStack(alignment: .topTrailing) {
                    Button(action: {
                        action()
                        saveFormula()
                    }){
                        Text(displayLabel).bold()
                            .padding(.vertical, 5)
                            .padding(.horizontal, 5)
                            .frame(width: width)
                    }.buttonStyle(.borderedProminent)
                        saveCircle()
                }
            } else {
                Button(action: {
                    action()
                    saveFormula()
                }){
                    Text(displayLabel).bold()
                        .padding(.vertical, 5)
                        .padding(.horizontal, 5)
                        .frame(width: width)
                        .background(Color.blue)
                }
            }
        }
    }
    
    private func saveCircle() -> some View {
        Circle()
            .fill(storageProvider.saveStatus
                  ? .green
                  : .gray)
            .scaledToFit()
            .frame(height: 8)
            .padding(8)
    }
    
    private func saveFormula() {
        storageProvider.saveFormula(formulaType, input: input, output: "")
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(displayLabel: "Find Mixed Air", formulaType: .mixedAirTemp,input: [""], output: "", action: { })
            .padding()
            .previewLayout(.sizeThatFits)
            .environmentObject(StorageProvider())
    }
}
