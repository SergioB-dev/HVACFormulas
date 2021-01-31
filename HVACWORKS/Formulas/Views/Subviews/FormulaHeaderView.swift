//
//  FormulaHeaderView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/31/21.
//

import SwiftUI

struct FormulaHeaderView: View {
    @Binding var showingDisclosureInfo: Bool
    @Binding var showingDisclosure: Bool
    @State private var disclosureType: DisclosureType = .info
    @State private var shouldAnimate = false
    
    
    let airFormula: AirFormulas
    let title: String
    let subtitle: String
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(title).bold()
                    .font(.title)
                Button(action: {
                    
                    guard !showingDisclosure else { return }
                    
                        self.disclosureType = .info
                    self.showingDisclosureInfo.toggle()
                    if self.shouldAnimate {
                        self.shouldAnimate = false
                    }
                    
                }){
                        Image(systemName: "info.circle")
                            .scaleEffect(showingDisclosureInfo ? 1.5 : 1.0)
                            .animation(.linear)
                    }.padding(.horizontal)
                    Button(action: {
                        guard !showingDisclosureInfo else { return }
                        self.disclosureType = .formula
                    self.showingDisclosure.toggle()
                    if self.shouldAnimate {
                        self.shouldAnimate = false
                    }

                    }){
                        Image(systemName: "x.squareroot")
                            .scaleEffect(showingDisclosure ? 1.5 : 1.0)
                            .animation(.linear)
                    }.padding(.horizontal)
            }
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            if showingDisclosure || showingDisclosureInfo {
                buttonShow(type: disclosureType)
            }
            
        }.padding(.horizontal)
    }
    @ViewBuilder private func buttonShow(type: DisclosureType) -> some View {
        
        switch type {
        
        case .info:
            VStack {
                Text(airFormula.info).bold()
                    .foregroundColor(.blue)
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.shouldAnimate = true
                }
            }
        case .formula:
            airFormula.formula(airFormula: airFormula)
        }
    }
}

struct FormulaHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FormulaHeaderView(showingDisclosureInfo: .constant(false), showingDisclosure: .constant(false), airFormula: AirFormulas.mixedAirTemp, title: "Mixed Air", subtitle: "Find out the final temperature of all combined air before it enters the coil").previewLayout(.sizeThatFits)
    }
}

enum DisclosureType {
    case info
    case formula
}

struct MixedAirFormulaView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("MAT = (%OA x T) + (%RA x T)").bold()
                .padding(.vertical)
            Divider()
            Text("Where:").bold()
                .foregroundColor(.blue)
            HStack {
                Text("MAT").bold()
                Text(" = mixed air temperature")
            }
            HStack {
                Text("%OA").bold()
                Text(" = Percent of outside air")
            }
            HStack {
                Text("%RA").bold()
                Text(" = Percent of return air")
            }
            HStack {
                Text("T").bold()
                Text(" = temperature")
            }
        }
    }
}

struct TotalHeatFormulaView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Q (total) = 4.5 x CFM x ∆H").bold()
                .padding(.vertical)
            Divider()
            Text("Where:").bold()
                .foregroundColor(.blue)
            HStack {
                Text("Q").bold()
                Text(" = total heat flow (BTUH)")
            }
            HStack {
                Text("CFM").bold()
                Text(" = air flow (cubic feet per minute")
            }
            HStack {
                Text("∆H").bold()
                Text(" = enthalpy difference (BTUH)")
            }
        }

    }
}

struct SensibleHeatFormulaView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Q (sensible) = 1.08 x CFM x ∆T").bold()
                .padding(.vertical)
            Divider()
            Text("Where:").bold()
                .foregroundColor(.blue)
            HStack {
                Text("Q").bold()
                Text(" = sensible heat flow (BTUH)")
            }
            HStack {
                Text("CFM").bold()
                Text(" = air flow (cubic feet per minute")
            }
            HStack {
                Text("%RA").bold()
                Text(" = Percent of return air")
            }
            HStack {
                Text("∆T").bold()
                Text(" = temperature difference DB")
            }
        }
    }
}

struct LatentHeatFormulaView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Q (latent) = 4840 x CFM x ∆W (lbs.)").bold()
                .padding(.vertical)
            Text("Q (latent) = .69 x CFM x ∆W (gr.)").bold()
                .padding(.top, -10)
            Divider()
            Text("Where:").bold()
                .foregroundColor(.blue)
            HStack {
                Text("Q").bold()
                Text(" = latent heat flow (BTUH)")
            }
            HStack {
                Text("CFM").bold()
                Text(" = air flow (cubic feet per minute")
            }
            HStack {
                Text("∆W").bold()
                Text(" = humidity ratio (lb. water / lb. dry air")
            }
            HStack {
                Text("∆W").bold()
                Text(" = humidity ratio (grains of water / lb. dry air")
            }
        }
    }
}
