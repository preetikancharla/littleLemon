//
//  UserData.swift
//  LittleLemon
//
//  Created by Preeti Kancharla on 11/1/23.
//

import Foundation
import SwiftUI

class UserData: ObservableObject {
    
    @AppStorage ("UserFirstName") var userFirstName:String = ""
    @AppStorage ("UserLastName") var userLastName:String = ""
    @AppStorage ("UserEmail") var userEmail:String = ""
    @AppStorage ("UserPhone") var userPhone:String = ""
    @AppStorage ("LoggedIn") var isLoggedIn: Bool = false
    @AppStorage ("UserOrderStatusNotifications") var orderStatusesNotifications: Bool = true
    @AppStorage ("UserPasswordChangesNotifications") var passwordChangesNotifications: Bool = true
    @AppStorage ("UserSpecialOffersNotifications") var specialOffersNotifications: Bool = true
    @AppStorage ("UserNewsLetterNotifications") var newsLetterNotifications: Bool = true
    
}
