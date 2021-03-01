//
//  FanLawFormulaView.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/19/21.
//

import SwiftUI

struct FanLawFormulaView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Group {
                    Text("Fan Law #1").bold()
                        .foregroundColor(.blue)
                    Text("CFM").bold()
                        .padding(.vertical)
                    Text("2")
                        .font(.system(size: 8.0))
                        .baselineOffset(-10)
                        .padding(.leading, -5)
                    Text("÷")
                    Text("CFM").bold()
                        .padding(.vertical)
                    Text("1")
                        .font(.system(size: 8.0))
                        .baselineOffset(-10)
                        .padding(.leading, -5)
                    Text(" = ")
                }
                Group {
                    Text("RPM").bold()
                        .padding(.vertical)
                    Text("2")
                        .font(.system(size: 8.0))
                        .baselineOffset(-10)
                        .padding(.leading, -5)
                    Text("÷")
                    Text("RPM").bold()
                        .padding(.vertical)
                    Text("1")
                        .font(.system(size: 8.0))
                        .baselineOffset(-10)
                        .padding(.leading, -5)
                }
                
            }
            HStack {
                Group {
                    Text("Fan Law #2").bold()
                        .foregroundColor(.blue)
                    Text("SP").bold()
                        .padding(.vertical)
                    Text("2")
                        .font(.system(size: 8.0))
                        .baselineOffset(-10)
                        .padding(.leading, -5)
                    Text("÷")
                    Text("SP").bold()
                        .padding(.vertical)
                    Text("1")
                        .font(.system(size: 8.0))
                        .baselineOffset(-10)
                        .padding(.leading, -5)
                    Text(" = ")
                }
                Group {
                    Text("(CFM").bold()
                        .padding(.vertical)
                    Text("2")
                        .font(.system(size: 8.0))
                        .baselineOffset(-10)
                        .padding(.leading, -5)
                    Text("÷")
                    Text("CFM").bold()
                        .padding(.vertical)
                    Text("1")
                        .font(.system(size: 8.0))
                        .baselineOffset(-10)
                        .padding(.leading, -5)
                    Text(")")
                        .padding(.leading, -8)
                    Text("2")
                        .font(.system(size: 8.0))
                        .baselineOffset(10)
                        .padding(.leading, -5)
                    
                }
            }.padding(.top, -20)
            Divider()
            Text("Where").bold()
                .foregroundColor(.blue)
                .padding(.bottom, 20)
            Group {
                HStack {
                    Text("CFM").bold()
                    Text(" = Cubic Feet per Minute")
                }
                HStack {
                    Text("SP").bold()
                    Text(" = Static Pressure")
                }
                Divider()
                HStack {
                    Text("**").bold()
                    Text("CFM").bold().padding(.leading, -5)
                    Text(" is interchangeable with:")
                }
                HStack {
                    Text("HZ").bold()
                    Text(" Hertz")
                }.padding(.top, 10)
                HStack {
                    Text("RPM").bold()
                    Text(" Revolutions per minute")
                }
                
            }
            
        }
    }
}
