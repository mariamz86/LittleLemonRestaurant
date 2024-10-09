//
//  MenuItem.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 25/08/2024.
//

import Foundation

struct MenuItem:  Codable, Identifiable  {
    var id = UUID()
    let title: String
    let price: String
    let dishdescription: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
           case title = "title"
           case dishdescription = "description"
           case price = "price"
           case image = "image"
           case category = "category"
       }
}
