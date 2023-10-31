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
    
    
    // Variables
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    var body: some View {
        VStack{
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            TextField("Email", text: $email)
            
            Button(action:{
                if (firstName.isEmpty || lastName.isEmpty || email.isEmpty) {
                    print("All fields are necessary")
                } else {
                    userFirstName = firstName
                    userLastName = lastName
                    userEmail = email
                }
            }) {
                Text("Register")
            }.buttonStyle(.bordered)
            
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
