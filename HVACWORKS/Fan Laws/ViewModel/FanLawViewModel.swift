//
//  FanLawViewModel.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/23/21.
//

import Foundation


class FanLawViewModel: ObservableObject {
    @Published var answer = ""
    @Published var firstEntry = ""
    @Published var secondEntry = ""
    @Published var thirdEntry = ""
    var fanLawSelection: FanLawSelection = .fanLaw1 {
        willSet {
            self.answer = ""
            self.firstEntry = ""
            self.secondEntry = ""
            self.thirdEntry = ""
        }
    }
    func calculateFanLaw1(firstEntry: String,
                          secondEntry: String,
                          rpm: String) -> String {
        guard let firstRealNumber = Double(firstEntry),
              let secondRealNumber = Double(secondEntry),
              let rpmNumber = Double(rpm) else { return "0"}
        let percentage = secondRealNumber / firstRealNumber
        return (rpmNumber * percentage).withCommas()
    }
    
    func calculateFanLaw2(firstEntry: String,
                          secondEntry: String,
                          thirdEntry: String,
                          fromCFMtoSP variance: Bool) -> String {
        switch variance {
        
        case true:
            guard let firstRealNumber = Double(firstEntry),
                  let secondRealNumber = Double(secondEntry),
                  let staticpressure = Double(thirdEntry) else { return "0"}
            let dividend = secondRealNumber / firstRealNumber
            let squaredAmount = pow(dividend, 2)
            let answer = squaredAmount * staticpressure
            return answer.withCommas()
        case false:
            guard let firstRealNumber = Double(firstEntry),
                  let secondRealNumber = Double(secondEntry),
                  let unknownVar = Double(thirdEntry) else { return "0"}
            let dividend = secondRealNumber / firstRealNumber
            let sqrt = dividend.squareRoot()
            let answer = unknownVar * sqrt
            return answer.withCommas()
        }
    }
}
