//
//  ViewModel.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/28/21.
//

import Foundation

class ElectricViewModel: ObservableObject {
    @Published var stage = Set<Stage>()
    @Published var selectedVariables = Set<Stage>()
    @Published var selectedIntForButton = Set<Int>()
    //MARK:- FINISH ELECTRICAL SECTION
    func calculateForVolts(lhs: Double, rhs: Double) -> Double {
        switch (lhs, rhs) {
        
        case (0,1):
            return voltsFromAmpsAndOhms(a: lhs, o: rhs)
        case (0,3):
            return voltsFromAmpsAndWatts(a: lhs, p: rhs)
        default:
            return 0
    }
    }
    
    /// Amps x Ohms = Volts
    /// - Parameters:
    ///   - a: Amps
    ///   - o: Ohms
    ///   -Returns: Volts
        private func voltsFromAmpsAndOhms(a: Double, o: Double) -> Double {
            a * o
        }
    
    /// P / I = Volts
    /// - Parameters:
    ///   - a: amps
    ///   - p: watts
    /// - Returns: Volts
    private func voltsFromAmpsAndWatts(a: Double, p: Double) -> Double {
        p / a
    }
}
enum Stage: Hashable {
    case stage1
    case stage2
    case stage3
    case stage4
}
