//
//  SensibleHeatFormulaView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/19/21.
//

import SwiftUI

struct SensibleHeatFormulaView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Q (sensible) = 1.08 x CFM x ∆T").bold()
                .padding(.vertical)
            Divider()
            Text("Where:").bold()
                .foregroundColor(.blue)
            HStack {
                Text("Q").bold()
                Text(" = sensible heat flow (BTUH)")
            }
            HStack {
                Text("CFM").bold()
                Text(" = air flow (cubic feet per minute")
            }
            HStack {
                Text("%RA").bold()
                Text(" = Percent of return air")
            }
            HStack {
                Text("∆T").bold()
                Text(" = temperature difference DB")
            }
        }
    }
}
