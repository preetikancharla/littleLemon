//
//  Menu.swift
//  LittleLemon
//
//  Created by Preeti Kancharla on 10/31/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            Text("Title")
            Text("Location")
            Text("Description")
            List(content: {})
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
