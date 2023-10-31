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
            VStack {
                
                // Navigation bar
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height:40)
              
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("LittleLemon")
                        .font(.custom("MarkaziText", size: 64))
                        .fontWeight(.medium)
                        .foregroundColor(Color("Primary2"))
                        .padding(.leading)
                        
                    Text("Chicago")
                        .font(.custom("MarkaziText", size: 40))
                        .fontWeight(.regular)
                        .foregroundColor(Color("Secondary3"))
                        .padding(.leading)
                    
                    HStack {
                        Text("We are a family owned\nMediterranean restaurant,\nfocused on traditional\nrecipes served with\na modern twist.")
                            .font(.custom("Karla", size: 18))
                            .fontWeight(.medium)
                            .foregroundColor(Color("Secondary3"))
                            .padding()
                            .lineLimit(5)
                        Image("profile_picture")
                            .resizable()
                            .scaledToFit()
                            //.frame(width:120, height:120)
                            .padding([.horizontal, .bottom])
                            
                    }
                }.background(Color("Primary1"))
                    
         
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
                    
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
