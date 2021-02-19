//
//  MixedAirModel.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/26/21.
//

import Foundation

struct MixedAirFormula {
    
    func cfmPercentages(cfmComponent x: [Double]) -> [Double]{
        
        var tempArray = [Double]()
        //let count = x.count + 1
        
        let total = x.reduce(0) { (res, dbl) in
            res + dbl
        }
        
        for i in x {
           let cfmPercentage = i / total
            tempArray.append(cfmPercentage)
        }
        print("CFM Percentages are: \(tempArray)")
        
        return tempArray
    }
    
    func cfmExtracter(entry: String) -> [Double]? {
        let extraction = entry.components(separatedBy: ", ")
        
        
        var tempArray = [Double]()
        
        for str in extraction {
            let number = Double(str)
            guard let realNumber = number else {
                continue
            }
            tempArray.append(realNumber)
        }
        print(cfmPercentages(cfmComponent: tempArray))
        
    return tempArray
        
    }
    
    func mainFormula(returnAirTemp w: Double,
                     returnAirCFM x: Double,
                     outdoorAirTemp y: Double,
                     outdoorAirCFM z: Double) -> Double {
        
        //let outdoorTemp = 4
        
        
        return 23.0
    }
    
    
}
