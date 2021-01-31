//
//  TotalHeat.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/27/21.
//

import SwiftUI

struct TotalHeat: View {
    @State private var showingDisclosure = false
    @State private var showingDiscloureInfo = false
    var body: some View {
        VStack {
            FormulaHeaderView(showingDisclosureInfo: $showingDiscloureInfo, showingDisclosure: $showingDisclosure, airFormula: .totalHeat, title: "Total Heat", subtitle: "Total heat is the total heat content of the air - the sum of both sensible and latent heat")
            Spacer()
        }
    }
}

struct TotalHeat_Previews: PreviewProvider {
    static var previews: some View {
        TotalHeat()
    }
}
