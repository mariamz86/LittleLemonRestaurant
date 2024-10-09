//
//  User.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 07/10/2024.
//

import Foundation

public let kFirstName = "first name key"
public let kLastName = "last name key"
public let kEmail = "email key"
public let kPhone = "phone key"
public let kIsLoggedIn = "kIsLoggedIn"

public let kOrderStatuses = "order statuses key"
public let kPasswordChanges = "Password Changes key"
public let kSpecialOffers = "Special Offers key"
public let kNewsletter = "Newsletter key"



class User: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Published var phoneNumber = UserDefaults.standard.string(forKey: kPhone) ?? ""
    
       
    @Published var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
    @Published var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
    @Published var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @Published var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    

}
