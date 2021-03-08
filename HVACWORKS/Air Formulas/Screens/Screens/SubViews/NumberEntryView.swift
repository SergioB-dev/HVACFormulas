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
    let isLatentHeat: Bool
    let actionCode: () -> ()
   
    init(firstEntry: Binding<String>, secondEntry: Binding<String>, selection: Binding<Int>, firstEntryPlaceHolder: String, secondEntryPlaceHolder: String, isLatentHeat: Bool, actionCode: @escaping () -> ()) {
        
        self._firstEntry = firstEntry
        self._secondEntry = secondEntry
        self._selection = selection
        self.firstEntryPlaceHolder = firstEntryPlaceHolder
        self.secondEntryPlaceHolder = secondEntryPlaceHolder
        self.isLatentHeat = isLatentHeat
        self.actionCode = actionCode
        
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
    
    
}

