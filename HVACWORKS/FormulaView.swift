//
//  DetailView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/26/21.
//

import SwiftUI

struct FormulaView: View {
    @State private var cfms = ""
    @State private var entries: Double = 0
    @State private var airEntries = [AirData]()
    @State private var temp = ""
    @State private var cfm = ""
    @State private var tempAlertShowing = false
    @State private var indoorAir = true
    @State private var mixedAirFinal: Double = 0
    
    let formula: AirFormulas
    let mixedAirModel = MixedAir()
    
    var body: some View {
        Group {
            VStack {
                
                Image(formula.thumbnail)
              
                Group {
                    VStack {
                        TextField("Temperature (Fº)", text: $temp)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 100)
                        TextField("Cubic feet per minute (CFM)", text: $cfm)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 100)
                        Picker("Indoor or Outdoor Air", selection: $indoorAir) {
                            Text("Indoor").tag(true)
                            Text("Outdoor").tag(false)
                        }.pickerStyle(SegmentedPickerStyle())
                      
                        Group {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(Array(zip(airEntries.indices, airEntries)), id: \.0) { (index, entry) in
                                        Button(action: {}) {
                                            VStack(alignment: .leading) {
                                                Text("Entry #\(index + 1)").bold()
                                                    .foregroundColor(.white)
                                                Rectangle()
                                                    .frame(width: 50, height: 1)
                                                    .foregroundColor(.black)
                                                Text(entry.indoor ? "Indoor Air" : "Outdoor Air").bold()
                                                    .foregroundColor(entry.indoor ? .green : .black)
                                                HStack {
                                                    Text("CFM").bold()
                                                        .foregroundColor(.white)
                                                    Text(String(entry.cfm))
                                                        .foregroundColor(.white)
                                                }
                                                
                                                HStack {
                                                    Text("Temp").bold()
                                                        .foregroundColor(.white)
                                                    Text(String(entry.temperature))
                                                        .foregroundColor(.white)
                                                }
                                            }.padding()
                                            .background(entry.indoor ? Color.blue : Color.orange)
                                            .cornerRadius(5.0)
                                            .padding()
                                        }
                                    }
                                }
                            }
                        }
                        VStack {
                            HStack {
                                Text("Total CFM:").bold()
                                Text(String(airEntries.reduce(0) { (start, finish) in start + finish.cfm }))
                            }.padding(.bottom, 20)
                            Text("Mixed Air Temperature: " + String(format: "%.2f", mixedAirFinal)).bold()
                            Button(action: {mixedAirIs()}){
                                Text("Find Mixed Air")
                                    .fontWeight(.bold)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }

                        }
                    }
                }
               
                
                Spacer()
              
            }
        }
    }
    func increment() {
        guard !temp.isEmpty, !cfm.isEmpty else {
            tempAlertShowing = true
            print("Temperature or cfm input was left empty")
            return
        }
        guard let temperatureNumber = Double(temp), let cfmNumber = Double(cfm) else {
            tempAlertShowing = true
            print("Temperature input was not a number")
            return
        }
        self.airEntries.append(AirData(cfm: cfmNumber, temperature: temperatureNumber, indoor: indoorAir))
        
    }
    
    func decrement() {
        self.entries -= 1
    }
    
    func mixedAirIs() -> Double {
        let cfmTotals = airEntries.map { $0.cfm }
        let temps = airEntries.map { $0.temperature }
        var percentages = [Double]()
        
        for i in cfmTotals {
            let percentage = i / airEntries.reduce(0) { (start, finish) in start + finish.cfm }
            percentages.append(percentage)
        }
        print("Percentages are: \(percentages)")
        
        let subTotal = zip(temps, percentages).map(*)
        
            
        
        print("SubTotals are: \(subTotal)")
        let mixedAirTotal = subTotal.reduce(0) { start, finish in
            start + finish
        }
        print("Final product is: \(mixedAirTotal)")
        self.mixedAirFinal = mixedAirTotal
        return mixedAirTotal
        
        
    }
    private struct AirData: Identifiable {
        let id = UUID()
        let cfm: Double
        let temperature: Double
        let indoor: Bool
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        FormulaView(formula: .mixedAirTemp)
    }
}
