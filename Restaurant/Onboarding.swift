//
//  Onboarding.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 19/08/2024.
//

import SwiftUI

//user defaults always initialized to string

/*let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kPhone = "phone key"
let kIsLoggedIn = "kIsLoggedIn"
let kOrderStatuses = "false"
let kPasswordChanges = "false"
let kSpecialOffers = "false"
let kNewsletter = "false"*/


struct Onboarding: View {
    
    @State var firstName: String = ""
    @State var lastName:  String = ""
    @State var email: String = ""
    @State var phonenum: String = ""
    @State var emptyFields = false
    @State var isLoggedIn = false
    
    var body: some View {
       
    NavigationView{
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                Header() .frame(maxWidth: .infinity, maxHeight: 100)
                Hero()
                    .padding()
                    .background(Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1)))
                    .frame(maxWidth: .infinity, maxHeight: 340)
                //Spacer()
                NavigationLink(destination: Home(), isActive: $isLoggedIn){
                    EmptyView()
                }
                
                VStack(alignment: .leading){
                    Text("First Name*")
                    
                    TextField("First Name", text: $firstName)
                    Text("Last Name *")
                    TextField("Last Name", text: $lastName)
                    Text("Email*")
                    TextField("Email address", text: $email)
                    Text("Phone number")
                    TextField("Phone number address", text: $phonenum)
                    
                }//end vstack
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
                Button("Next") {
                    
                    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty) {
                        emptyFields = true
                        print("Missing information")
                    } else {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(phonenum, forKey: kPhone)
                        UserDefaults.standard.set(true, forKey: kOrderStatuses)
                        UserDefaults.standard.set(true, forKey: kPasswordChanges)
                        UserDefaults.standard.set(true, forKey: kSpecialOffers)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        print("\(UserDefaults.standard.bool(forKey:kIsLoggedIn))")
                        isLoggedIn=true
                        firstName = ""
                        lastName = ""
                        email = ""
                        phonenum = ""
                    }
                }.alert("Missing information", isPresented: $emptyFields) {
                    Button("OK", role: .cancel) { }
                }
                .font(.headline)
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .foregroundColor(Color.black)
                .padding(10)
                .background(Color.yellow)
                .cornerRadius(8)
                .padding()
                
            }
        }//end scrollview
            }.onAppear{
                if(UserDefaults.standard.bool(forKey: kIsLoggedIn)){
                    isLoggedIn = true
            }
                
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        
        //Spacer()
            
    }
      
    }



struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
