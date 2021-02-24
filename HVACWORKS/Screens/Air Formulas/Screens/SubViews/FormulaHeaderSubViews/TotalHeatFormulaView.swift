//
//  TotalHeatFormulaView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/19/21.
//

import SwiftUI

struct TotalHeatFormulaView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Q (total) = 4.5 x CFM x ∆H").bold()
                .padding(.vertical)
            Divider()
            Text("Where:").bold()
                .foregroundColor(.blue)
            HStack {
                Text("Q").bold()
                Text(" = total heat flow (BTUH)")
            }
            HStack {
                Text("CFM").bold()
                Text(" = air flow (cubic feet per minute")
            }
            HStack {
                Text("∆H").bold()
                Text(" = enthalpy difference (BTUH)")
            }
        }
        
    }
}

struct totalHeat_preview: PreviewProvider {
    static var platform: PreviewPlatform = .iOS
    static var previews: some View {
        TotalHeatFormulaView()
            
    }
}
