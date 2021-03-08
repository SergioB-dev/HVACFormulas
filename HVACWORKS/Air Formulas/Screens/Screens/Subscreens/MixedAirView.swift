//
//  DetailView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/26/21.
//

import SwiftUI

struct MixedAirView: View{
    @State private var cfms = ""
    @State private var entries: Double = 0
    @State private var airEntries = [AirData]()
    @State private var temp = ""
    @State private var cfm = ""
    @State private var tempAlertShowing = false
    @State private var indoorAir = true
    @State private var mixedAirFinal: Double = 0
    @State private var isAnimated = false
    @State private var showingDisclosure = false
    @State private var isFinalAnswerReceived = false

    
    let mixedAirModel = MixedAirFormula()
    
    var body: some View {
        Group {
            VStack {
                FormulaHeaderView(showingDisclosure: $showingDisclosure, airFormula: .mixedAirTemp, title: "Mixed Air", subtitle: "The final air product entering the return coil.                              ")
                
                Group {
                    VStack {
                            VStack{
                                if isAnimated {
                                    Text("Step 1: Enter entries").bold()
                                    Text("At least 2 entries")
                                        .font(.caption)
                                }
                                NumberEntryView(firstEntry: $temp, secondEntry: $cfm, selection: .constant(0), firstEntryPlaceHolder: "Temperature (Fº)", secondEntryPlaceHolder: "Cubic Feet / Minute", isLatentHeat: false) {
                                    increment()
                                    self.hideKeyboard()
                                }
                                
                                
                                
                            }.padding(.horizontal)
                        Picker("Indoor or Outdoor Air", selection: $indoorAir) {
                            Text("Indoor").tag(true)
                            Text("Outdoor").tag(false)
                                .foregroundColor(.orange)
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
                       Spacer()
                        MixedAirResultView(isAnimated: $isAnimated,
                                           myClosure: mixedAirIs,
                                           result: mixedAirFinal,
                                           data: airEntries,
                                            isFinalAnswerReceived: $isFinalAnswerReceived)
                    }.opacity(showingDisclosure ? 0.0 : 1.0)
                }
                
                
                Spacer()
            }.navigationBarBackButtonHidden(showingDisclosure ? true : false)
            .padding(.top, showingDisclosure ?  100 : 0)
        }
    }
    private func increment() {
        self.isFinalAnswerReceived = false
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
        self.temp = ""
        self.cfm = ""
        
    }
    
    private func decrement() {
        self.entries -= 1
    }
    
    private func mixedAirIs() -> Double {
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
        self.isFinalAnswerReceived = true
        return mixedAirTotal
        
        
    }
    
  
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MixedAirView()
        }
    }
}


