//
//  Text + Extensions.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/28/21.
//

import SwiftUI

extension Text {
    func headerView() -> some View {
        self
            .bold()
            .font(.headline)
            .padding()
    }
}
