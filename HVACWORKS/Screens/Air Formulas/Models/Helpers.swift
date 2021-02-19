//
//  Helpers.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/24/21.
//

import Foundation
import SwiftUI

let airFormulas = ["Mixed Air Temperature"]


enum Formulas: String, CaseIterable {
    
    case mixedAirTemp = "Mixed Air Temperature"
    case sensibleHeat = "Sensible Heat"
    case latentHeat = "Latent Heat"
    case totalHeat = "Total Heat"
    case fanLaw = "Fan Law"
    
  

    

    
//    var thumbnail: String {
//        switch self {
//
//        case .mixedAirTemp:
//            return "mixedAir"
//        case .sensibleHeat:
//            return "sensibleHeat"
//        case .totalHeat:
//            return "totalHeat"
//        case .latentHeat:
//            return "latentHeat"
//        }
//    }
    
    
    @ViewBuilder func formula(airFormula: Formulas) -> some View {
        switch airFormula {
        case .mixedAirTemp:
            MixedAirFormulaView()
        case .sensibleHeat:
            SensibleHeatFormulaView()
        case .totalHeat:
            TotalHeatFormulaView()
        case .latentHeat:
            LatentHeatFormulaView()
        case .fanLaw:
            FanLawFormulaView()
        }
    }
}

struct AirData: Identifiable {
    let id = UUID()
    let cfm: Double
    let temperature: Double
    let indoor: Bool
}

#if canImport(UIKit)

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

enum DisclosureType {
    
    case formula
}
