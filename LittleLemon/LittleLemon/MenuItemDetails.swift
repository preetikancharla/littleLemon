//
//  MenuItemDetails.swift
//  LittleLemon
//
//  Created by Preeti Kancharla on 11/1/23.
//

import SwiftUI

struct MenuItemDetails: View {
    
    @State var dish: Dish
    
    var body: some View {
        VStack{
            
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
            
            VStack(alignment: .center) {
                
                Spacer()
                
                AsyncImage(url: URL(string: dish.image!)) {
                    phase in
                    if let image = phase.image {
                        image.resizable()
                    } else if phase.error != nil {
                        Color.red
                    } else {
                        Color.blue
                    }
                }.frame(width: 200, height: 200)
                
                Spacer()
                
                Text(dish.title ?? "")
                    .font(.custom("Karla-Bold", size: 18))
                Text(dish.desc ?? "")
                    .font(.custom("Karla-Regular", size: 16))
                Text(convertToCurrency(dish.price))
                    .font(.custom("Karla-Medium", size: 16))
                
                Spacer()
                
                Button(action:{
                    print("\(dish.title ?? "No title") added to cart")
                }) {
                    Text("Add to cart")
                }
                .frame(maxWidth:.infinity)
                .padding(.vertical)
                .font(.custom("Karla-ExtraBold", size: 16))
                .fontWeight(.bold)
                .background(Color("Primary2"))
                .cornerRadius(16)
                .foregroundColor(Color("Secondary4"))
                
                Spacer()
            }.padding(.horizontal, 10)
        }
    }
    
    func convertToCurrency(_ value: String?) -> String {
        
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter.string(for: Double(value ?? "0.0") ?? 0.0 ) ?? "Free"
    }
}


