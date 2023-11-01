//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by Preeti Kancharla on 10/30/23.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    
    @StateObject var userData: UserData = UserData()
    
    var body: some Scene {
        WindowGroup {
            Onboarding().environmentObject(userData)
        }
    }
}
