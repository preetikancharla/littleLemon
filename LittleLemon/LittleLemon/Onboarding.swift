//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Preeti Kancharla on 10/30/23.
//

import SwiftUI

struct Onboarding: View {
   
    @AppStorage ("UserFirstName") var userFirstName:String = ""
    @AppStorage ("UserLastName") var userLastName:String = ""
    @AppStorage ("UserEmail") var userEmail:String = ""
    @AppStorage ("LoggedIn") var isLoggedIn: Bool = false
    
    // Variables
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    var body: some View {
        
        NavigationView{
            
            VStack (alignment: .center, spacing: 100){
               
                NavigationLink(destination: Home(), isActive: $isLoggedIn){EmptyView()}
                
                VStack (alignment: .leading, spacing: 40){
                    TextField("First Name", text: $firstName)
                        .padding()
                        .border(Color("Secondary4"), width: 1)
                                            
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .border(Color("Secondary4"), width: 1)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .border(Color("Secondary4"), width: 1)
                }
                
                Button(action:{
                    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty) {
                        print("All fields are necessary")
                    } else {
                        userFirstName = firstName
                        userLastName = lastName
                        userEmail = email
                        isLoggedIn = true
                    }
                }) {
                    Text("Register")
                }.buttonStyle(.bordered)
                
            }.padding()
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
