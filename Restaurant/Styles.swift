//
//  Styles.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 21/09/2024.
//

import SwiftUI

struct ButtonStylePrimaryColor1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1)) : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1)))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1)), lineWidth: 1)
            )
            //.padding(.horizontal)
    }
}

struct ButtonStylePrimaryColorReverse: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1)))
            .padding(10)
            .background(configuration.isPressed ? Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1)) : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1)), lineWidth: 1)
            )
           // .padding(.horizontal)
    }
}

struct CategoryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .cornerRadius(15)
            .background (
                configuration.isPressed ? Color.gray : Color.white
            )
            .foregroundColor(Color.black)
    }
}
struct CatToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundColor(Color.black)
        .padding(5)
        .background {
            if configuration.isOn {
                Color.white
            }
            else{
                Color.gray
            }
        }
        .cornerRadius(8)
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor( Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1)))

                configuration.label
                    
            }
        })
    }
}
