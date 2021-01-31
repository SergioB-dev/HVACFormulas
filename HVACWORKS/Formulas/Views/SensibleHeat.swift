//
//  SensibleHeat.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/27/21.
//

import SwiftUI

struct SensibleHeat: View {
    @State private var showingDisclosure = false
    @State private var showingDisclousreInfo = false
    var body: some View {
        VStack {
            FormulaHeaderView(showingDisclosureInfo: $showingDisclousreInfo, showingDisclosure: $showingDisclosure, airFormula: .sensibleHeat, title: "Sensible Heat", subtitle: "Sensible is the heat that can be perceived physically as opposed to Latent Heat")
            Spacer()
        }
        
    }
}

struct SensibleHeat_Previews: PreviewProvider {
    static var previews: some View {
        SensibleHeat()
    }
}
