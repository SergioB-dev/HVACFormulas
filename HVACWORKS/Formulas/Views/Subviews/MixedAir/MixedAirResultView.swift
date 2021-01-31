//
//  MixedAirResultView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/27/21.
//

import Foundation
import SwiftUI

struct MixedAirResultView: View {
    @State private var isShowingAlert = false
    @Binding var isAnimated: Bool
    let myClosure: () -> Double
    let result: Double
    let data: [AirData]
    
    @Binding var isFinalAnswerReceived: Bool
    var finalAnswerAnimation: Animation? {
        isFinalAnswerReceived ? .easeIn : nil
    }
    var body: some View {
        VStack {
            HStack {
                Text("Total CFM:").bold()
                Text(String(data.reduce(0) { (start, finish) in start + finish.cfm }))
            }.padding(.bottom, 20)
            HStack {
                Text("Mixed Air Temperature: ").bold()
                    .padding(.horizontal)
                Text(String(format: "%.2f", result))
                    .scaleEffect(isFinalAnswerReceived ? 1.5 : 1.0)
                    .foregroundColor(isFinalAnswerReceived ? .green : .primary)
                    .animation(finalAnswerAnimation)
            }
            Button(action: {
                guard self.data.count >= 2 else {
                    self.isShowingAlert = true
                    return
                }
                    myClosure()
                
            }){
                Text("Find Mixed Air")
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                    .background(data.count <= 1 ? Color.gray : .blue)
                    .cornerRadius(10)
            }.alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Must first enter at least 2 entries"), message: nil, dismissButton: .default(Text("Ok")) {
                    self.isAnimated = true
                }
                
                )
            }
            
        }
    }
}
