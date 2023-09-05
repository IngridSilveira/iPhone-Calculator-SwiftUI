//
//  Custom.swift
//  Calculator
//
//  Created by userext on 04/09/23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 90, height: 90)
            .background(configuration.isPressed ?  Color.lightgray : Color.gray)
            .clipShape(Circle())
    }
}

struct CustomButtonStyleOrange: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 90, height: 90)
                .background(configuration.isPressed ?  Color.lightorange : Color.neworange)
                .clipShape(Circle())
                .foregroundColor(.white)
    }
}

struct CustomButtonStyleDarkGray: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 90, height: 90)
                .background(configuration.isPressed ?  Color.mediumgray : Color.darkgray)
                .clipShape(Circle())
    }
}

struct CustomButtonStyleZero: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 190, height: 90)
            .background(configuration.isPressed ?  Color.mediumgray : Color.darkgray)
            .clipShape(Capsule())
    }
}

extension Color {
    static let darkgray = Color(red: 0.160, green: 0.160, blue: 0.160)
    static let neworange = Color(red: 0.84, green: 0.58, blue: 0.19)
    static let lightgray = Color(red: 0.7, green: 0.7, blue: 0.7)
    static let mediumgray = Color(red: 0.35, green: 0.35, blue: 0.35)
    static let lightorange = Color(red: 0.94, green: 0.68, blue: 0.32)
}
