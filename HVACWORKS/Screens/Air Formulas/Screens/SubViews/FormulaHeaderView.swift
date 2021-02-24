//
//  FormulaHeaderView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/31/21.
//

import SwiftUI

struct FormulaHeaderView: View {
    
    @Binding var showingDisclosure: Bool
    @State private var disclosureType: DisclosureType = .formula
    @State private var shouldAnimate = false
    
    
    let airFormula: Formulas
    let title: String
    let subtitle: String
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(title).bold()
                    .font(.title)
                
                Button(action: {
                    
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
            Divider()
            
            if showingDisclosure  {
                buttonShow(type: disclosureType)
            }
            
        }.padding()
    }
    
    @ViewBuilder private func buttonShow(type: DisclosureType) -> some View {
        
        switch type {
        
        case .formula:
            airFormula.formula(airFormula: airFormula)
        }
    }
}

struct FormulaHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FormulaHeaderView(showingDisclosure: .constant(false), airFormula: Formulas.mixedAirTemp, title: "Mixed Air", subtitle: "Find out the final temperature of all combined air before it enters the coil").previewLayout(.sizeThatFits)
    }
}











struct FormulaHeaderView_Previews_2: PreviewProvider {
    static var previews: some View {
        FanLawFormulaView().previewLayout(.sizeThatFits)
    }
}
