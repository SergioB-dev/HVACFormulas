//
//  RouterView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/27/21.
//

import SwiftUI

struct AirFormulaRouterView: View {
    let formula: AirFormulaCases
    var body: some View {
       router(formula: formula)
        
    }
    @ViewBuilder func router(formula: AirFormulaCases) -> some View {
        switch formula {
        case .mixedAirTemp:
            MixedAirView()
        case .totalHeat:
            TotalHeat()
        case .latentHeat:
            LatentHeat()
        case .sensibleHeat:
            SensibleHeat()
        }
    }
}



struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        AirFormulaRouterView(formula: .mixedAirTemp)
    }
}
