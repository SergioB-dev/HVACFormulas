//
//  LatentHeatFormulaView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/19/21.
//

import SwiftUI

struct LatentHeatFormulaView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Q (latent) = 4840 x CFM x ∆W (lbs.)").bold()
                .padding(.vertical)
            Text("Q (latent) = .69 x CFM x ∆W (gr.)").bold()
                .padding(.top, -10)
            Divider()
            Text("Where:").bold()
                .foregroundColor(.blue)
            HStack {
                Text("Q").bold()
                Text(" = latent heat flow (BTUH)")
            }
            HStack {
                Text("CFM").bold()
                Text(" = air flow (cubic feet per minute)")
            }
            HStack {
                Text("∆W").bold()
                Text(" = humidity ratio (lb. water / lb. dry air)")
            }
            HStack {
                Text("∆W").bold()
                Text(" = humidity ratio (grains of water / lb. dry air)")
            }
        }
    }
}
