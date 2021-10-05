//
//  SwiftUIView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/4/21.
//

import SwiftUI

struct SettingScreen: View {
    @EnvironmentObject var storageProvider: StorageProvider
    var body: some View {
        Form {
            Section(header: Text("Formulas")) {
                Toggle("Save answer after every calculation", isOn: $storageProvider.shouldSaveAfterEveryCalculation)
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
