//
//  Helpers.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/24/21.
//

import Foundation

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
}
