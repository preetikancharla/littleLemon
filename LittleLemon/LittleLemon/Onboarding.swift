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
              
                // Hero Section
                VStack(alignment: .leading, spacing: 0) {
                    Text("Little Lemon")
                        .font(.custom("MarkaziText-Medium", size: 64))
                        .foregroundColor(Color("Primary2"))
                        .padding(.horizontal, 10)
                        
                    Text("Chicago")
                        .font(.custom("MarkaziText-Regular", size: 40))
                        .foregroundColor(Color("Secondary3"))
                        .padding(.horizontal, 10)
                        .padding(.top, -20)
                    
                    HStack {
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(.custom("Karla-Medium", size: 18))
                            .foregroundColor(Color("Secondary3"))
                            .lineLimit(5)
                        Image("restaurant")
                            .resizable()
                            .scaledToFit()
                            .frame(width:140, height:140)
                    }.padding(.horizontal, 10)
                        .padding(.top, -20)
                        .padding(.bottom, 10)
                        
                }
                .frame(maxWidth: .infinity)
                .background(Color("Primary1"))
                
                Spacer()
         
                VStack (alignment: .center){
                    
                    NavigationLink(destination: Home(), isActive: $isLoggedIn){EmptyView()}
                    
                    VStack (alignment: .leading, spacing: 10){
                        (Text("First name:") + Text(" *").baselineOffset(1.0))
                            .font(.custom("Karla-Medium", size: 16))
                        TextField("First Name", text: $firstName)
                            .padding([.vertical, .leading], 5)
                            .font(.custom("Karla-Regular", size: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("Secondary3"), lineWidth: 2)
                                )
                            .autocorrectionDisabled(true)
                        (Text("Last name:") + Text(" *").baselineOffset(1.0))
                            .font(.custom("Karla-Medium", size: 16))
                        TextField("Last Name", text: $lastName)
                            .padding([.vertical, .leading], 5)
                            .font(.custom("Karla-Regular", size: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("Secondary3"), lineWidth: 2)
                                )
                            .autocorrectionDisabled(true)
                        (Text("Email:") + Text(" *").baselineOffset(1.0))
                            .font(.custom("Karla-Medium", size: 16))
                        TextField("Email", text: $email)
                            .padding([.vertical, .leading], 5)
                            .font(.custom("Karla-Regular", size: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("Secondary3"), lineWidth: 2)
                                )
                            .autocorrectionDisabled(true)
                    }.padding(.horizontal)
                    
                    Spacer()
                    
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
                        Text("Log in")
                    }
                    .frame(maxWidth:.infinity)
                    .padding(.vertical)
                    .font(.custom("Karla-ExtraBold", size: 16))
                    .fontWeight(.bold)
                    .background(Color("Primary2"))
                    .cornerRadius(16)
                    .foregroundColor(Color("Secondary4"))
                        
                    Spacer()
                    
                }.padding()
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
