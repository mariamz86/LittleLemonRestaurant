//
//  Home.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 19/08/2024.
//

import SwiftUI

struct Home: View {
    
    let persistenceController = PersistenceController.shared //initialise core data when app lunches
    
    
    var body: some View {
        
       
         NavigationView{
        VStack(spacing:0){
            
            Header().frame(maxWidth: .infinity, maxHeight: 60)
            
            Menu()//the environment modifier send context to menu view to be able to access its content
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
                
        }
        .navigationBarBackButtonHidden(true)
          //
        .navigationBarHidden(true)
         
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
