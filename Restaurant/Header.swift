//
//  Header.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 19/09/2024.
//

import SwiftUI

struct Header: View {
    @State var isLoggedIn = false
    
    
    var body: some View {
     
            VStack{
                ZStack {
                    Image("Logo")
                    HStack {
                        Spacer()
                        if isLoggedIn  {
                            NavigationLink(destination: UserProfile()) {
                                Image("ProfileImg")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(maxHeight: 50)
                                    .clipShape(Circle())
                                    .padding(.trailing)
                            }
                            
                        }
                    }
                }
                Spacer()
            }
        
        
        
        
        .onAppear() {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
        }
   
        .navigationViewStyle(StackNavigationViewStyle())
       }
}
struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
