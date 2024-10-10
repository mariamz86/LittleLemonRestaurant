//
//  Home.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 19/08/2024.
//

import SwiftUI

struct Home: View {
    
    let persistenceController = PersistenceController.shared //initialise core data when app lunches
    
    @State var selectedTab = 0
    
    var body: some View {
        VStack(spacing:0){
            Header().frame(maxWidth: .infinity, maxHeight: 60)
            TabView(selection: $selectedTab){
                
                Menu()//the environment modifier send context to menu view to be able to access its content
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                    .tag(0)
                UserProfile()
                    .tabItem {
                        Label("Profile", systemImage: "square.and.pencil")
                    }
                    .tag(1)
                
                
            }.navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                
                
        }
    }
       
        
        //.navigationBarHidden(true)
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
