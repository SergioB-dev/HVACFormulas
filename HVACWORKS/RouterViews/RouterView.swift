//
//  RouterView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/27/21.
//

import SwiftUI

struct RouterView: View {
    let formula: Formulas
    var body: some View {
       router(formula: formula)
        
    }
    @ViewBuilder func router(formula: Formulas) -> some View {
        switch formula {
        case .mixedAirTemp:
            MixedAirView()
        case .totalHeat:
            TotalHeat()
        case .latentHeat:
            LatentHeat()
        case .sensibleHeat:
            SensibleHeat()
        case .fanLaw:
            FanLawView()
        }
    }
}



struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView(formula: .mixedAirTemp)
    }
}
