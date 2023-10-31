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
    @State var searchText: String = ""
    
    var body: some View {
        VStack{
            Text("Title")
            Text("Location")
            Text("Description")
            
            Spacer()
            
            TextField("Search menu", text: $searchText)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                (dishes: [Dish]) in
                List {
                    ForEach(dishes) {
                        dish in
                        HStack (spacing: 5) {
                            Text("\(dish.title ?? ""): \(dish.price ?? "")" )
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
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "%K CONTAINS[cd] %@", "title", searchText)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
