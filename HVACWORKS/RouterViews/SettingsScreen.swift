//
//  SwiftUIView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/4/21.
//

import SwiftUI

struct SettingScreen: View {
    @AppStorage("saveStatus") var saveStatus = false
    @EnvironmentObject var storageProvider: StorageProvider
    var body: some View {
        Form {
            Section(header: Text("Formulas")) {
                Toggle("Automatically save every formula", isOn: $saveStatus)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
            .environmentObject(StorageProvider())
    }
}


struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 22, height: 22)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
