//
//  Helpers.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/24/21.
//

import Foundation
import SwiftUI

let airFormulas = ["Mixed Air Temperature"]

///Used to display Menu Items on AirFormula entry view.
enum AirFormulaCases: String, CaseIterable {
    case mixedAirTemp = "Mixed Air Temperature"
    case sensibleHeat = "Sensible Heat"
    case latentHeat = "Latent Heat"
    case totalHeat = "Total Heat"
}


/// Used to iterate formula views
enum Formulas: String, CaseIterable {
    
    case mixedAirTemp = "Mixed Air Temperature"
    case sensibleHeat = "Sensible Heat"
    case latentHeat = "Latent Heat"
    case totalHeat = "Total Heat"
    case fanLaw = "Fan Law"
    
    @ViewBuilder func formula(airFormula: Formulas) -> some View {
        switch airFormula {
        case .mixedAirTemp:
            MixedAirFormulaView()
        case .sensibleHeat:
            SensibleHeatFormulaView()
        case .totalHeat:
            TotalHeatFormulaView()
        case .latentHeat:
            LatentHeatFormulaView()
        case .fanLaw:
            FanLawFormulaView()
        }
    }
}

struct AirData: Identifiable {
    let id = UUID()
    let cfm: Double
    let temperature: Double
    let indoor: Bool
}

#if canImport(UIKit)

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

enum DisclosureType {
    case formula
}


/**
Fan Laws

# CFM varies directly as the rpm
* Fan Law 1 = (CFM2 / CFM1) = (RPM2 / RPM1)

# Static pressure varies as the square of the rpm
* Fan Law 2 = (SP2 / SP1) = (RPM2 / RPM1)²
 
 -> RPM can be interchanged with units:
* CFM
* Hertz
*/
 enum FanLawSelection {
    case fanLaw1
    case fanLaw2
}

 enum FanLaw1ButtonSelection {
    case cfm
    case rpm
}

enum FanLaw2ButtonSelection {
    case cfm
    case rpm
    case hertz
    case staticPressure
}


 func successVibrate() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}


struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: 50)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8.0)
    }
}


struct SecondaryButton: ButtonStyle {
    @ObservedObject var vm: ElectricViewModel
    @Binding var unit: CommonElectricalUnits?
    let index: Int
    let disabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: 50)
            .padding()
            .background(disabled ? Color.gray : .orange)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
                    .opacity(vm.selectedIntForButton.contains(index) ? 1.0 : 0.0)
                
            )
    }
    
}
