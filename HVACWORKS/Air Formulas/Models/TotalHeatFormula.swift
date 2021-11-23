//
//  TotalHeatFormula.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/1/21.
//

import Foundation

struct TotalHeatFormula {
    func totalHeat(cfm: String, deltaH: String) -> Double {
        guard let cfmNumber = Double(cfm), let deltaHNumber = Double(deltaH) else { return 0}
        
        let answer = (4.5 * cfmNumber * deltaHNumber)
        return answer
    }
    
    func persistValue(str: String, passValue: (String) -> ()) {
        passValue(str)
    }
}

