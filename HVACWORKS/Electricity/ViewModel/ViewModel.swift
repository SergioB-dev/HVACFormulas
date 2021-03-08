//
//  ViewModel.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/28/21.
//

import Foundation
import SwiftUI

class ElectricViewModel: ObservableObject {
    @Published var stage = Set<Stage>()
    @Published var selectedVariables = Set<Stage>()
    @Published var selectedIntForButton = Set<Int>()
    @Published var selectedElectricalUnit: CommonElectricalUnits? = nil
    @Published var lhs = ""
    @Published var rhs = ""
    @Published var answer: Double = 0
    let lhsString = ""
    let rhsString = ""
    var lhsDouble: Double? {
        Double(lhsString)
    }
    var rhsDouble: Double? {
        Double(rhsString)
    }
    
    //MARK:- FINISH ELECTRICAL SECTION
    
    func chooseAppropriateCalculation(varToFind x: CommonElectricalUnits,
                                      firstKnownVar y: CommonElectricalUnits,
                                      secondKnownVar z: CommonElectricalUnits) -> (Double, Double) -> Double {
        switch (x, y, z) {
        // All Amp cases
        
        case(.amps, .volts, .ohms):
            return { $0 / $1}
        case(.amps, .ohms, .volts):
            return { $1 / $0}
        case(.amps, .watts, .volts):
            return { $0 / $1 }
        case(.amps, .volts, .watts):
            return { $1 / $0 }
        case(.amps, .watts, .ohms):
            return { ($0 / $1).squareRoot() }
        case(.amps, .ohms, .watts):
            return { ($1 / $0).squareRoot() }
            
        // All Watt cases
        
        case(.watts, .volts, .amps):
            return { $0 * $1 }
        case(.watts, .amps, .volts):
            return { $0 * $1 }
        case(.watts, .amps, .ohms):
            return {($0 * $0) * $1 }
        case(.watts, .ohms, .amps):
            return {($1 * $1) * $0 }
        case(.watts, .volts, .ohms):
            return {($0 * $0) / $1 }
        case (.watts, .ohms, .volts):
            return {($1 * $1) / $0}
        // All Volt cases
            
        case(.volts, .watts, .amps):
            return { $0 / $1 }
        case(.volts, .amps, .watts):
            return { $1 / $0 }
        case(.volts, .ohms, .amps):
            return { $0 * $1 }
        case(.volts, .amps, .ohms):
            return { $0 * $1}
        case(.volts, .ohms, .watts):
            return { ($0 * $1).squareRoot() }
        case(.volts, .watts, .ohms):
            return {($0 * $1).squareRoot() }
            
            // All Ohm cases
        
        case(.ohms, .volts, .amps):
            return { $0 / $1 }
        case(.ohms, .amps, .volts):
            return { $1 / $0 }
        case(.ohms, .watts, .amps):
            return { $0 / ($1 * $1)}
        case (.ohms, .amps, .watts):
            return {($0 * $0) / $1 }
        case (.ohms, .volts, .watts):
            return { ($0 * $0) / $1 }
        case (.ohms, .watts, .volts):
            return {($1 * $1) / $0 }
        default:
            return { $0 + $1}
        }
    }
    
    
    
    
    
    func calculateForVolts(lhs: Int, rhs: Int) -> Double {
        switch (lhs, rhs) {
        
        case (0,1):
            return voltsFromAmpsAndOhms(a: lhsDouble ?? 0, o: rhsDouble ?? 0)
        case (0,3):
            return voltsFromAmpsAndWatts(a: lhsDouble ?? 0, p: rhsDouble ?? 0)
        default:
            return 0
    }
    }
    
    /// Amps x Ohms = Volts
    /// - Parameters:
    ///   - a: Amps
    ///   - o: Ohms
    ///  - Returns: Volts
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
    

    
    func convertIndexToUnit(index: Int) -> String {
        switch index {
        case 0:
            return "Amps"
        case 1:
            return "Ohms"
        case 2:
            return "Volts"
        case 3:
            return "Watts"
        default:
            return ""
        }
    }
}
enum Stage: Hashable {
    case stage1
    case stage2
    case stage3
    case stage4
}


struct ElectricEntryView: View {
    @State private var lhs = ""
    @State private var rhs = ""
    var body: some View {
        VStack {
            TextField("", text: $lhs)
        }
    }
   
}
