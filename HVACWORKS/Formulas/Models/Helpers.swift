//
//  Helpers.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/24/21.
//

import Foundation
import SwiftUI

let airFormulas = ["Mixed Air Temperature"]


enum AirFormulas: String, CaseIterable {
    
    case mixedAirTemp = "Mixed Air Temperature"
    case sensibleHeat = "Sensible Heat"
    case totalHeat = "Total Heat"
    case latentHeat = "Latent Heat"
    
    var thumbnail: String {
        switch self {
        
        case .mixedAirTemp:
            return "mixedAir"
        case .sensibleHeat:
            return "sensibleHeat"
        case .totalHeat:
            return "totalHeat"
        case .latentHeat:
            return "latentHeat"
        }
    }
    
    var info: String {
        switch self {
       
        case .mixedAirTemp:
            return "Some Text To Show"
        case .sensibleHeat:
            return "Some Text To Show For Sensible Heat"
        case .totalHeat:
            return "Some Text for Total Heat"
        case .latentHeat:
            return "Some Text for Latent Heat"
        }
    }
    
    @ViewBuilder func formula(airFormula: AirFormulas) -> some View {
        switch airFormula {
        case .mixedAirTemp:
            MixedAirFormulaView()
        case .sensibleHeat:
            SensibleHeatFormulaView()
        case .totalHeat:
            TotalHeatFormulaView()
        case .latentHeat:
            LatentHeatFormulaView()
        }
    }
}

struct AirData: Identifiable {
    let id = UUID()
    let cfm: Double
    let temperature: Double
    let indoor: Bool
}
