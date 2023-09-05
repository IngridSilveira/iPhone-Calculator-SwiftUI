//
//  ContentView.swift
//  Calculator
//
//  Created by userext on 30/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vM: ContentViewModel
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Spacer()
            HStack {
                Text(vM.values)
                    .padding()
                    .lineLimit(1)
                    .font(.system(size: CGFloat(250 / Int(Double(String(vM.result).count + 10) / 4.0))))
                    .foregroundColor(.white)
            }
            
            HStack {
                Button("AC"){
                    vM.reset()
                }.buttonStyle(CustomButtonStyle())
                
                Button("+/-") {
                    vM.result = vM.result * -1
                    vM.calculate()
                }.buttonStyle(CustomButtonStyle())
                
                Button("%") {
                    vM.result = vM.result / 100
                    vM.calculate()
                }.buttonStyle(CustomButtonStyle())
                
                Button("/") {
                    vM.calculate()
                    vM.operation = 4
                }.buttonStyle(CustomButtonStyleOrange())
                
            }.padding(.vertical, 5)
                .foregroundColor(.black)
            
            HStack {
                Button("7"){
                    vM.process(digit: 7)
                }.buttonStyle(CustomButtonStyleDarkGray())
                
                Button("8") {
                    vM.process(digit: 8)
                }.buttonStyle(CustomButtonStyleDarkGray())
                
                Button("9") {
                    vM.process(digit: 9)
                }.buttonStyle(CustomButtonStyleDarkGray())
                
                Button("x") {
                    vM.calculate()
                    vM.operation = 3
                }.buttonStyle(CustomButtonStyleOrange())
                
            }.padding(.vertical, 5)
                .foregroundColor(.white)
            
            HStack {
                Button("4"){
                    vM.process(digit: 4)
                }.buttonStyle(CustomButtonStyleDarkGray())
                
                Button("5") {
                    vM.process(digit: 5)
                }.buttonStyle(CustomButtonStyleDarkGray())
                
                Button("6") {
                    vM.process(digit: 6)
                }.buttonStyle(CustomButtonStyleDarkGray())
                
                Button("-") {
                    vM.calculate()
                    vM.operation = 2
                }.buttonStyle(CustomButtonStyleOrange())
                
            }.padding(.vertical, 5)
                .foregroundColor(.white)
            
            HStack {
                Button("1"){
                    vM.process(digit: 1)
                }.buttonStyle(CustomButtonStyleDarkGray())
                
                Button("2") {
                    vM.process(digit: 2)
                }.buttonStyle(CustomButtonStyleDarkGray())
                
                Button("3") {
                    vM.process(digit: 3)
                }.buttonStyle(CustomButtonStyleDarkGray())
                
                Button("+") {
                    vM.operation = 1
                    vM.calculate()
                }.buttonStyle(CustomButtonStyleOrange())
                
            }.padding(.vertical, 5)
                .foregroundColor(.white)
            
            HStack {
                Button("0") {
                    vM.process(digit: 0)
                }.buttonStyle(CustomButtonStyleZero())
                
                Button(",") {
                    if vM.decimal == 0.0 {
                        vM.decimal = 10.0
                        vM.values = vM.values + ","
                    }
                }.buttonStyle(CustomButtonStyleDarkGray())
                
                Button("=") {
                    vM.calculate()
                    vM.previousOperation = 999
                    vM.operation = 999
                }.buttonStyle(CustomButtonStyleOrange())
                
            }.padding(.vertical, 5)
                .foregroundColor(.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .font(.custom("Poppins", size: 35))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vM: ContentViewModel())
    }
}
