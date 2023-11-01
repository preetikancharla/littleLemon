//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Preeti Kancharla on 10/31/23.
//

import SwiftUI

struct UserProfile: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var orderStatusesNotifications: Bool = true
    @State var passwordChangesNotifications: Bool = true
    @State var specialOffersNotifications: Bool = true
    @State var newsLetterNotifications: Bool = true
    
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userData: UserData
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
    
            // Navigation bar
            ZStack {
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height:40)
                
                HStack {
                    Spacer()
                    
                    Image("profile_picture")
                        .resizable()
                        .scaledToFit()
                        .frame(height:40)
                        .mask(Circle())
                        .padding(.trailing)
                }
            }.frame(maxWidth: .infinity)
            
            Spacer()
            
            Group{
                Text("Personal Information")
                    .font(.custom("Karla-Medium", size: 18))
                
                HStack (alignment:.center) {
                    Image("profile_picture")
                        .resizable()
                        .scaledToFit()
                        .frame(width:100, height: 100)
                    
                    Button(action: {
                        
                    }){
                        Text("Change")
                    }.padding()
                        .font(.custom("Karla-ExtraBold", size: 16))
                        .background(Color("Primary1"))
                        .foregroundColor(Color("Secondary3"))
                        .cornerRadius(10)
                    
                    Button(action: {
                        
                    }){
                        Text("Remove")
                    }.padding()
                        .font(.custom("Karla-ExtraBold", size: 16))
                        .foregroundColor(Color("Primary1"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("Secondary3"), lineWidth: 2)
                        )
                    
                }
                
                VStack (alignment: .leading, spacing: 5){
                    VStack (alignment: .leading, spacing:0){
                        Text("First name:")
                            .font(.custom("Karla-Medium", size: 16))
                        TextField("First Name", text: $firstName)
                            .padding([.vertical, .leading], 5)
                            .font(.custom("Karla-Regular", size: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("Secondary3"), lineWidth: 2)
                                )
                            .autocorrectionDisabled(true)
                    }
                    VStack (alignment: .leading, spacing:0){
                        Text("Last name:")
                            .font(.custom("Karla-Medium", size: 16))
                        TextField("Last Name", text: $lastName)
                            .padding([.vertical, .leading], 5)
                            .font(.custom("Karla-Regular", size: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("Secondary3"), lineWidth: 2)
                                )
                            .autocorrectionDisabled(true)
                    }
                    VStack (alignment: .leading, spacing:0){
                        Text("Email:")
                            .font(.custom("Karla-Medium", size: 16))
                        TextField("Email", text: $email)
                            .padding([.vertical, .leading], 5)
                            .font(.custom("Karla-Regular", size: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("Secondary3"), lineWidth: 2)
                                )
                            .autocorrectionDisabled(true)
                    }
                    VStack (alignment: .leading, spacing:0){
                        Text("Phone number:")
                            .font(.custom("Karla-Medium", size: 16))
                        TextField("Phone number", text: $phone)
                            .padding([.vertical, .leading], 5)
                            .font(.custom("Karla-Regular", size: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("Secondary3"), lineWidth: 2)
                                )
                            .autocorrectionDisabled(true)
                    }
                }.padding(.horizontal)
            }
            
            Spacer()
            
            Group{
                Text("Email Notifications")
                    .font(.custom("Karla-Medium", size: 18))
                
                VStack (alignment: .leading){
                    Toggle(isOn: $orderStatusesNotifications) {
                        Text("Order statuses")
                            .font(.custom("Karla-Regular", size: 16))
                    }.toggleStyle(iOSCheckboxToggleStyle())
                    
                    Toggle(isOn: $passwordChangesNotifications) {
                        Text("Password changes")
                            .font(.custom("Karla-Regular", size: 16))
                    }.toggleStyle(iOSCheckboxToggleStyle())
                    
                    Toggle(isOn: $specialOffersNotifications) {
                        Text("Special offers")
                            .font(.custom("Karla-Regular", size: 16))
                    }.toggleStyle(iOSCheckboxToggleStyle())
                    
                    Toggle(isOn: $newsLetterNotifications) {
                        Text("Newsletter")
                            .font(.custom("Karla-Regular", size: 16))
                    }.toggleStyle(iOSCheckboxToggleStyle())
                }.foregroundColor(Color("Secondary4"))
            }
            
            Spacer()
            
            Button(action:{
                userData.isLoggedIn = false
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Logout")
            }
            .frame(maxWidth:.infinity)
            .padding(.vertical)
            .font(.custom("Karla-ExtraBold", size: 16))
            .fontWeight(.bold)
            .background(Color("Primary2"))
            .cornerRadius(16)
            .foregroundColor(Color("Secondary4"))
            
            Spacer()
            
            HStack{
                Spacer()
                Button(action: {
                    
                    firstName = userData.userFirstName
                    lastName = userData.userLastName
                    email = userData.userEmail
                    phone = userData.userPhone
                    orderStatusesNotifications = userData.orderStatusesNotifications
                    passwordChangesNotifications = userData.passwordChangesNotifications
                    specialOffersNotifications = userData.specialOffersNotifications
                    newsLetterNotifications = userData.newsLetterNotifications
                    
                }){
                    Text("Discard changes")
                }.padding()
                    .font(.custom("Karla-ExtraBold", size: 16))
                    .foregroundColor(Color("Primary1"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Primary1"), lineWidth: 2)
                    )
                
                Spacer()
                
                Button(action: {
                
                    userData.userFirstName = firstName
                    userData.userLastName = lastName
                    userData.userEmail = email
                    userData.userPhone = phone
                    userData.orderStatusesNotifications = orderStatusesNotifications
                    userData.passwordChangesNotifications = passwordChangesNotifications
                    userData.specialOffersNotifications = specialOffersNotifications
                    userData.newsLetterNotifications = newsLetterNotifications
                    
                }){
                    Text("Save changes")
                }.padding()
                    .font(.custom("Karla-ExtraBold", size: 16))
                    .background(Color("Primary1"))
                    .cornerRadius(10)
                    .foregroundColor(Color("Secondary3"))
                
                Spacer()
                
            }
            Spacer()
            
        }.padding(.horizontal, 10)
            .onAppear(perform: {
                // Get the initial values
                firstName = userData.userFirstName
                lastName = userData.userLastName
                email = userData.userEmail
                phone = userData.userPhone
                orderStatusesNotifications = userData.orderStatusesNotifications
                passwordChangesNotifications = userData.passwordChangesNotifications
                specialOffersNotifications = userData.specialOffersNotifications
                newsLetterNotifications = userData.newsLetterNotifications
               
            })
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                configuration.label
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
