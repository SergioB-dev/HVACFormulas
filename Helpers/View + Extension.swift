//
//  View + Extension.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 3/18/21.
//

import SwiftUI

extension View {
    func frameChapterBody(goodColors: [Color], index: Int) -> some View {
        self
        .frame(width: UIScreen.main.bounds.width * 0.45,
                height: UIScreen.main.bounds.height * 0.4)
        .background(goodColors[index])
        .cornerRadius(10)
        .padding()
    }
}
