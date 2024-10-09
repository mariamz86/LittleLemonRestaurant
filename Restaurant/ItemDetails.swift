//
//  ItemDetails.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 23/09/2024.
//

import SwiftUI

struct ItemDetails: View {
    
    let dish: Dish
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
            Text(dish.title!)
            Text(dish.dishdescription ?? "")
                               .frame(maxWidth: .infinity, alignment: .leading)
                               .lineLimit(2)
            Text("$" + (dish.price ?? ""))
            }
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                           image
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                       } placeholder: {
                           ProgressView()
                       }
                       .clipShape(Rectangle())
                       .frame(minHeight: 150)
           
        }
    }
}

/*struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails()
    }
}*/
