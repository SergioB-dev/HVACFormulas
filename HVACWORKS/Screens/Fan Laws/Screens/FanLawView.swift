//
//  FanLawView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/18/21.
//

import SwiftUI

struct FanLawView: View {
    @State private var showingDisclosure = false
    var body: some View {
        VStack {
            FormulaHeaderView(showingDisclosure: $showingDisclosure, airFormula: .fanLaw, title: "Fan Law", subtitle: "How air movement is in proportion to other states")
            Group {
                VStack {
                    
                }
            }
            Spacer()
        }
    }
}

struct FanLawView_Previews: PreviewProvider {
    static var previews: some View {
        FanLawView()
    }
}
