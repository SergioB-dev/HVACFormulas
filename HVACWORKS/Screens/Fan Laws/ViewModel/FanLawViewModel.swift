//
//  FanLawViewModel.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/23/21.
//

import Foundation

struct FanLawViewModel {
    func calculateFanLaw1(firstEntry: String,
                          secondEntry: String,
                          rpm: String) -> String {
        guard let firstRealNumber = Double(firstEntry),
              let secondRealNumber = Double(secondEntry),
              let rpmNumber = Double(rpm) else { return "0"}
        let percentage = secondRealNumber / firstRealNumber
        return (rpmNumber * percentage).withCommas()
    }
}
