//
//  ContentView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/24/21.
//

import SwiftUI

struct ContentView: View {
       
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Air Formulas").fontWeight(.black)
                    .font(.title)
                    .padding(.bottom, 50)
                ForEach(Formulas.allCases, id: \.self) { formula in
                    NavigationLink(
                        destination: RouterView(formula: formula)) {
                    Text(formula.rawValue).bold()
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 300)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                        }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
