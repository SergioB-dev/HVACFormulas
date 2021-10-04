//
//  SwiftUIView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 10/4/21.
//

import SwiftUI

struct SettingScreen: View {
    @EnvironmentObject var controlCenter: UserControlCenter
    var body: some View {
        Form {
            Section(header: Text("Formulas")) {
                Toggle("Save answer after every calculation", isOn: $controlCenter.shouldSaveAfterEveryCalculation)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
            .environmentObject(UserControlCenter())
    }
}
