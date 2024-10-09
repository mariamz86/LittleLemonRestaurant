//
//  UserProfile.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 22/08/2024.
//

import SwiftUI

struct UserProfile: View {
    //The string method of the UserDefaults returns an Optional value, so when setting the constants to the Text elements, you //will need to unwrap them first, for instance, optionalStringConstant ?? "" 
    
    
    @StateObject private var user = User()
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    @State private var isLoggedOut = false
    
    @Environment(\.presentationMode) var presentation //The presentation mode allows you to control the presentation and dismissal of the current view
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            NavigationLink(destination: Onboarding(), isActive: $isLoggedOut) { }
            VStack{
                //Header() .frame(maxWidth: .infinity, maxHeight: 100)
                VStack(alignment: .leading){
                    Text("Personal information")
                        .font(.headline)
                    VStack(alignment:.leading){
                        Text("Avatar")
                            .font(.caption)
                        HStack{
                            Image("ProfileImg")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .bottom)
                                .clipShape(Circle())
                            Button("Change"){}
                                .buttonStyle(ButtonStylePrimaryColor1())
                                .frame(maxWidth: 100, maxHeight: 40)
                                .font(.system(size: 10))
                                .lineLimit(1)
                            Button("Remove"){}
                                .buttonStyle(ButtonStylePrimaryColorReverse())
                                .frame(maxWidth: 100, maxHeight: 40)
                                .font(.system(size: 10))
                                .lineLimit(1)
                        }
                    }
                    
                    Text("First Name:")
                    TextField(user.firstName, text:$firstName)
                    Text("Last Name :")
                    TextField(user.lastName, text:$lastName)
                    Text("Email Address :")
                    TextField(user.email, text:$email)
                    Text("Phone Number :")
                    TextField(user.phoneNumber, text:$phoneNumber)
                    
                    Text("Email notifications")
                        .font(.headline)
                        .padding(.vertical)
                    VStack(alignment: .leading){
                        Toggle("Order statuses", isOn: $orderStatuses)
                        Toggle("Password changes", isOn: $passwordChanges)
                        Toggle("Special offers", isOn: $specialOffers)
                        Toggle("Newsletter", isOn: $newsletter)
                    }
                    .font(.subheadline)
                }
                .foregroundColor(.black)
                .toggleStyle(iOSCheckboxToggleStyle())
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
                Button( "Log out"){
                    UserDefaults.standard.set("", forKey: kFirstName)
                    UserDefaults.standard.set("", forKey: kLastName)
                    UserDefaults.standard.set("", forKey: kEmail)
                    UserDefaults.standard.set("", forKey: kPhone)
                    UserDefaults.standard.set(false, forKey: kOrderStatuses)
                    UserDefaults.standard.set(false, forKey: kPasswordChanges)
                    UserDefaults.standard.set(false, forKey: kSpecialOffers)
                    UserDefaults.standard.set(false, forKey: kNewsletter)
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    
                    
                    isLoggedOut = true
                    //self.presentation.wrappedValue.dismiss()
                } .frame(maxWidth: .infinity)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(10)
                    .background(.yellow)
                    .cornerRadius(8)
                    .padding(.horizontal)
                Spacer()
                
                
                HStack(alignment: .center) {
                    Button("Discard Changes") {
                        
                        self.presentation.wrappedValue.dismiss()
                    }
                    .frame(width: 150, height: 50)
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .buttonStyle(ButtonStylePrimaryColorReverse())
                    
                    
                    Button("Save changes") {
                        
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(phoneNumber, forKey: kPhone)
                        
                        UserDefaults.standard.set(orderStatuses , forKey: kOrderStatuses)
                        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                        
                        print("\(user.orderStatuses)")
                        self.presentation.wrappedValue.dismiss()
                    }
                    .frame(width: 150, height: 50)
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .buttonStyle(ButtonStylePrimaryColor1())
                   
                } .padding(.horizontal)
            }
            .padding()
            .overlay{
                RoundedRectangle(cornerRadius: 9)
                          .stroke(.gray, lineWidth: 1)
                          
            }
        }.padding(40)
            .toolbar{Header()}
            .onAppear{
                
                firstName = user.firstName
                lastName = user.lastName
                email = user.email
                phoneNumber = user.phoneNumber
                
                orderStatuses = user.orderStatuses
                passwordChanges = user.passwordChanges
                specialOffers = user.specialOffers
                newsletter = user.newsletter
                
            }
        //   .navigationBarBackButtonHidden(true)
        //      .navigationBarHidden(true)
        
    }
}

/*struct UserProfile_Previews: PreviewProvider {
 static var previews: some View {
 UserProfile(user: <#User#>)
 }
 }*/
