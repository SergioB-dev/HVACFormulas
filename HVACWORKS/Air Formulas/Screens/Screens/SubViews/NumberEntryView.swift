//
//  NumberEntryView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/31/21.
//

import SwiftUI



struct NumberEntryView: View {
    @Binding var firstEntry: String
    @Binding var secondEntry: String
    @Binding var selection: Int
    
    var firstEntryPlaceHolder: String
    var secondEntryPlaceHolder: String
    let formula: Formulas
    let isLatentHeat: Bool
    let actionCode: () -> ()
    let destructiveActionCode: () -> Void
   
    init(firstEntry: Binding<String>, secondEntry: Binding<String>, selection: Binding<Int>, firstEntryPlaceHolder: String, secondEntryPlaceHolder: String,formula: Formulas, isLatentHeat: Bool, actionCode: @escaping () -> (), destructiveActionCode: @escaping () -> Void) {
        
        self._firstEntry = firstEntry
        self._secondEntry = secondEntry
        self._selection = selection
        self.firstEntryPlaceHolder = firstEntryPlaceHolder
        self.secondEntryPlaceHolder = secondEntryPlaceHolder
        self.formula = formula
        self.isLatentHeat = isLatentHeat
        self.actionCode = actionCode
        self.destructiveActionCode = destructiveActionCode
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(hue: 0.60, saturation: 0.80, brightness: 1, alpha: 1)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        
    }
    
    var body: some View {
        VStack {
            TextField(firstEntryPlaceHolder, text: $firstEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.horizontal)
            
            TextField(secondEntryPlaceHolder, text: $secondEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.horizontal)
            
            if isLatentHeat {
                Picker("", selection: $selection) {
                    Text("Pounds of Water").tag(0)
                        .background(Color.blue)
                    Text("Grains of Water").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.bottom)
                
            }
            buttonRow()
        }
    }
    
    @ViewBuilder private func buttonRow() -> some View {
        if formula == .mixedAirTemp {
            HStack {
                Spacer()
                Button(action: { destructiveActionCode() }) {
                    Text("Reset").bold()
                        .padding()
                        .frame(height: 40)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(4.0)
                        .frame(height: 40)
                }.buttonStyle(PlainButtonStyle())
                
                    Spacer()
                    Button(action: { actionCode()
                        self.hideKeyboard()
                    }) {
                        Text("Enter").bold()
                            .padding()
                            .frame(height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(4.0)
                            .frame(height: 40)
                    }.buttonStyle(PlainButtonStyle())

                    Spacer()
            }
        } else {
            HStack {
                Spacer()
                Button(action: { destructiveActionCode() }) {
                    Text("Reset").bold()
                        .padding()
                        .frame(height: 40)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(4.0)
                        .frame(height: 40)
                }.buttonStyle(PlainButtonStyle())
                Spacer()
                
                SaveButton(plainButton: false, displayLabel: "Enter", formulaType: formula, width: 65, height: 40, cornRadius: 4.0, input: passInput(), output: "") { actionCode() }
                Spacer()
            }
        
        }
    }
    /// A convenience method for neatly passing data from the user to save function
    /// - Returns: An array of strings with array[0] == name of value (ex. CFM) /
    ///    array[1] == actual value (ex. 400) /
    ///
    /// Can expect up to two pairs of data input.
    /// Tuples would be more ideal here but objc cannot parse tuples.
    /// May be an issue to improve in the future.
    private func passInput() -> [String] {
        //TODO: - MAKE A BETTER RETURN IN THIS CASE
        guard !firstEntry.isEmpty else { return [""]}
        let inputLabel = firstEntryPlaceHolder
        let actualInput = firstEntry
        
        let inputLabel2 = secondEntryPlaceHolder
        let actualInput2 = secondEntry
        
        return [inputLabel,actualInput, inputLabel2, actualInput2]
    }
    
}

