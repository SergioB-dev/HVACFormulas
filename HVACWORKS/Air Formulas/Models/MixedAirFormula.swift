//
//  MixedAirModel.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/26/21.
//

import Foundation

struct MixedAirFormula {
    let storageProvider = StorageProvider.shared
    
    func cfmPercentages(cfmComponent x: [Double]) -> [Double] {
        
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
}
