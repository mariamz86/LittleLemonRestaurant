//
//  MenuList.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 25/08/2024.
//

import Foundation

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
