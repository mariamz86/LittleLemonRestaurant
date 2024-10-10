//
//  Hero.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 18/09/2024.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack {
            Text("Little Lemon")
                .foregroundColor(.yellow)
                .font(Font.custom("Al Firat Regular", size: 50).weight(.medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                  HStack {
                      VStack {
                        
                          Text("Chicago")
                              .foregroundColor(.white)
                              .font(Font.custom("Markazi Text Medium", size: 32))
                              .frame(maxWidth: .infinity, alignment: .leading)
                              .padding(-5)
                          Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                          .foregroundColor(.white)
                          .frame(maxWidth: .infinity, alignment: .leading)
                          .lineLimit(5)
                          .font(Font.custom("Markazi Text Medium", size: 14))
                          .padding(.top)
                      }
                      Image("Hero-image")
                          .resizable()
                          .aspectRatio( contentMode: .fill)
                          .frame(maxWidth: 150, maxHeight: 150)
                          .clipShape(Rectangle())
                          .cornerRadius(16)
                  }
              }
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
    }
}
