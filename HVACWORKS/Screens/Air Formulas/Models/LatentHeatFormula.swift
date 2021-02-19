//
//  LatentHeatFormula.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/1/21.
//

import Foundation

struct LatentHeatFormula {
  
    func latentHeat(selection: Int, variable: String, cfm: String) -> () -> String {
    
        guard let realNumber = Double(variable), let cfmNumber = Double(cfm) else {return {"0"}}
        if selection == 0 {
            return {
                let answer = 4840 * cfmNumber * realNumber
                return answer.withCommas()
            }
        } else {
            return {
                let answer = 0.69 * cfmNumber * realNumber
                return answer.withCommas()
            }
        }
    }
    
}
