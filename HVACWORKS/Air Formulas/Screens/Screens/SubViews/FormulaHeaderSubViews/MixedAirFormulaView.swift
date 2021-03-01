//
//  MixedAirFormulaView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/19/21.
//

import SwiftUI

struct MixedAirFormulaView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("MAT = (%OA x T) + (%RA x T)").bold()
                .padding(.vertical)
            Divider()
            Text("Where:").bold()
                .foregroundColor(.blue)
            HStack {
                Text("MAT").bold()
                Text(" = mixed air temperature")
            }
            HStack {
                Text("%OA").bold()
                Text(" = Percent of outside air")
            }
            HStack {
                Text("%RA").bold()
                Text(" = Percent of return air")
            }
            HStack {
                Text("T").bold()
                Text(" = temperature")
            }
        }
    }
}
