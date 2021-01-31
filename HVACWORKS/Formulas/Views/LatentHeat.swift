//
//  LatentHeat.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/27/21.
//

import SwiftUI

struct LatentHeat: View {
    @State private var showingDisclosure = false
    @State private var showingDisclosureInfo = false
            
    var body: some View {
        VStack {
            FormulaHeaderView(showingDisclosureInfo: $showingDisclosureInfo, showingDisclosure: $showingDisclosure, airFormula: .latentHeat, title: "Latent Heat", subtitle: "Latent is the heat involved in substances changing state as opposed to heat that is sensible")
            Spacer()
        }
    }
}

struct LatentHeat_Previews: PreviewProvider {
    static var previews: some View {
        LatentHeat()
    }
}
