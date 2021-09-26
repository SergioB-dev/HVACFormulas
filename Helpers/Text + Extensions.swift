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
    
    func chapterHeaderText() -> some View {
        self
            .bold()
                .frame(maxWidth: .infinity)
                .lineLimit(3)
                .padding(.top, 40)
                .padding()
                .font(.custom("", size: 20))
                .foregroundColor(.white)
    }
    
    func chapterBodyText() -> some View {
        self
            .foregroundColor(.white)
                .fontWeight(.black)
                .frame(width: UIScreen.main.bounds.width * 0.38)
                .padding()
                .background(Color.black.opacity(0.2))
                .cornerRadius(7)
    }
}
