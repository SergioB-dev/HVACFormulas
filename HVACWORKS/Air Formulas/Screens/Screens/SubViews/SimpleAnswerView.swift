//
//  AnswerView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/1/21.
//

import SwiftUI

struct SimpleAnswerView: View {
    let firstParam: String
    let secondParam: String
    let firstOutput: String
    let secondOutput: String
    let buttonLabel: String
    
    var body: some View {
        VStack {
            HStack {
                Text(firstParam).bold()
                Text(String(firstOutput))
            }.padding()
            HStack {
                Text(secondParam).bold()
                Text(String(secondOutput))
            }
        }
    }
}
