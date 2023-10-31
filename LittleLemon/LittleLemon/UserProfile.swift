//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Preeti Kancharla on 10/31/23.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName = UserDefaults.standard.string(forKey: "UserFirstName")
    let lastName = UserDefaults.standard.string(forKey: "UserLastName")
    let email = UserDefaults.standard.string(forKey: "UserEmail")
    
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            Text("Personal Information")
            
            Image("profile_image_placeholder")
                .resizable()
                .scaledToFit()
                .frame(width:200, height: 200)
            
            Text(firstName ?? "First name not found")
            Text(lastName ?? "Last name not found")
            Text(email ?? "Email not found" )
            
            Spacer()
            
            Button(action: {
                UserDefaults.standard.set(false, forKey: "LoggedIn")
                self.presentation.wrappedValue.dismiss()
                
            }) {
                Text("Logout")
            }.buttonStyle(.bordered)
            
        }.padding()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
