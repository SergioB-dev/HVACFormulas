//
//  SensibleHeatFormula.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/1/21.
//

import SwiftUI

struct SensibleHeatFormula {
    
    func sensibleHeat(deltaT: String) -> String {
        guard let realNumber = Double(deltaT) else {return "0"}
        let answer =  1.08 * 4.5 * realNumber
        return answer.withCommas()
    }
    func cfmCalc(cfm: String, passValue: (String) -> ()) {
        guard Double(cfm) != nil else { return }
        passValue(cfm)
    }
}
