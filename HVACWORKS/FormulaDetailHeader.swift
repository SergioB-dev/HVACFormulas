//
//  FormulaDetailHeader.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/24/21.
//

import SwiftUI

struct FormulaDetailHeader: View {
    let formula: Formula
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FormulaDetailHeader_Previews: PreviewProvider {
    static var previews: some View {
        FormulaDetailHeader(formula: Formula(equation: "Mixed Air = (IA) * (OA)", definition: "", explanation: "", useCase: ""))
    }
}
