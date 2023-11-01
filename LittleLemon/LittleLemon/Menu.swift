//
//  Menu.swift
//  LittleLemon
//
//  Created by Preeti Kancharla on 10/31/23.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var userData: UserData
    
    @State var searchText: String = ""
    @State var categoryFilterText: String = ""
    
    private let numberFormatter: NumberFormatter
    
    init(){
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
    }
    
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
                        .font(.custom("Karla-Medium", size: 16))
                        .foregroundColor(Color("Secondary3"))
                        .lineLimit(5)
                    Image("restaurant")
                        .resizable()
                        .scaledToFit()
                        .frame(width:140, height:140)
                        
                }.padding(.horizontal, 10)
                    .padding(.top, -20)
                   
                TextField("🔍 Search menu", text: $searchText)
                    .font(.custom("Karla-Regular", size: 18))
                    .padding(10)
                    .background(Color("Secondary3"))
                    .border(Color("Secondary4"), width: 1)
                    .padding(10)
            }
            .frame(maxWidth: .infinity)
            .background(Color("Primary1"))
        
            VStack(alignment: .leading) {
                Text("Order for delivery")
                    .textCase(.uppercase)
                    .font(.custom("Karla-ExtraBold", size: 20))
                
                
                HStack {
                    Button(action: {
                        categoryFilterText = (categoryFilterText == "Starters") ? "" : "Starters"
                        print("Category text is" , categoryFilterText)
                    }) {
                        Text("Starters")
                            .font(.custom("Karla-Bold", size: 16))
                    }.buttonStyle(.bordered)
                        .background(Color(categoryFilterText == "Starters" ? "Primary1" : "Secondary3"))
                        .foregroundColor(Color(categoryFilterText == "Starters" ? "Secondary3" : "Primary1"))
                    
                    Button(action: {
                        categoryFilterText = (categoryFilterText == "Mains") ? "" : "Mains"
                    }) {
                        Text("Mains")
                            .font(.custom("Karla-Bold", size: 16))
                    }.buttonStyle(.bordered)
                        .background(Color(categoryFilterText == "Mains" ? "Primary1" : "Secondary3"))
                        .foregroundColor(Color(categoryFilterText == "Mains" ? "Secondary3" : "Primary1"))
                    
                    Button(action: {
                        categoryFilterText = (categoryFilterText == "Desserts") ? "" : "Desserts"
                    }) {
                        Text("Desserts")
                            .font(.custom("Karla-Bold", size: 16))
                    }.buttonStyle(.bordered)
                        .background(Color(categoryFilterText == "Desserts" ? "Primary1" : "Secondary3"))
                        .foregroundColor(Color(categoryFilterText == "Desserts" ? "Secondary3" : "Primary1"))
                    
                    Button(action: {
                        
                        categoryFilterText = (categoryFilterText == "Sides") ? "" : "Sides"
                    }) {
                        Text("Sides")
                            .font(.custom("Karla-Bold", size: 16))
                    }.buttonStyle(.bordered)
                        .background(Color(categoryFilterText == "Sides" ? "Primary1" : "Secondary3"))
                        .foregroundColor(Color(categoryFilterText == "Sides" ? "Secondary3" : "Primary1"))
                }.padding(.bottom, 10)
                
            }
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                (dishes: [Dish]) in
                List {
                    ForEach(dishes, id:\.id) {
                        dish in
                        NavigationLink(destination: MenuItemDetails(dish: dish)){
                            HStack (spacing: 5) {
                                VStack (alignment:.leading, spacing: 10){
                                    Text(dish.title ?? "")
                                        .font(.custom("Karla-Bold", size: 18))
                                    Text(dish.desc ?? "")
                                        .font(.custom("Karla-Regular", size: 16))
                                    Text(numberFormatter.string(for: Double(dish.price ?? "0.0") ?? 0.0 ) ?? "Free")
                                        .font(.custom("Karla-Medium", size: 16))
                                }
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
                                }.frame(width: 100, height: 100)
                                
                            }
                        }
                    }
                }.listStyle(.plain)
            }
        }.onAppear(perform: {
            getMenuData()
        })
    }
    
    func getMenuData() {
        
        // delete all data before getting fresh data since the menu changes from time to time
        PersistenceController.shared.clear()
        
        // get fresh data from the server
        let dataURLStr = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let dataURL = URL(string: dataURLStr)!
        let request = URLRequest(url: dataURL)
        
        URLSession.shared.dataTask(with: request) {data, response ,error in
            
            if let data = data {
                let decoder = JSONDecoder()
                let menuList = try? decoder.decode(MenuList.self, from: data)
                if let menuList = menuList {
                    for item in menuList.menu {
                            
                        let dish = Dish(context: viewContext)
                        dish.id = Int16(item.id)
                        dish.title = item.title
                        dish.desc = item.desc
                        dish.image = item.image
                        dish.price = item.price
                        dish.category = item.category
                       
                    }
                    try? viewContext.save()
                }
            }
            
        }.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty && categoryFilterText.isEmpty {
            return NSPredicate(value: true)
        } else if searchText.isEmpty && !categoryFilterText.isEmpty {
            return NSPredicate(format: "%K CONTAINS[cd] %@", "category", categoryFilterText)
        } else if !searchText.isEmpty && categoryFilterText.isEmpty {
            return NSPredicate(format: "%K CONTAINS[cd] %@", "title", searchText)
        } else {
            return NSPredicate(format: "%K CONTAINS[cd] %@ and %K CONTAINS[cd] %@", "title", searchText, "category", categoryFilterText)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
