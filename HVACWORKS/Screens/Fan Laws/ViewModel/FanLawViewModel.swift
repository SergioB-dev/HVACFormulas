//
//  FanLawViewModel.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/23/21.
//

import Foundation

struct FanLawViewModel {
    func calculateFanLaw1(firstEntry: Double, secondEntry: Double, rpm: Double) -> Double {
        let percentage = secondEntry / firstEntry
        return rpm * percentage
    }
}
