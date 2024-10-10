//
//  Menu.swift
//  Restaurant
//
//  Created by Mariam Alzuwawi on 19/08/2024.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext//to access context passed by the home view, its retrieved and stored in the var viewContext
    @State var loaded = false
    @State var searchText = ""
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    
    
    //var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
    
    
    func getMenuData(){ // JSON parsing and transefering it to entities in the core date
        
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                let fullMenu = try! decoder.decode(MenuList.self, from: data)
                for menuitem in fullMenu.menu{
                    let newDish = Dish(context: viewContext)
                    newDish.title = menuitem.title
                    newDish.price = menuitem.price
                    newDish.image = menuitem.image
                    newDish.dishdescription = menuitem.dishdescription
                    newDish.category = menuitem.category
                }
                guard viewContext.hasChanges else { return}// save changes to disk rather than memory
                do {
                    try viewContext.save()
                } catch (let error) {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
    
    var body: some View {
        
        
        VStack(spacing:0){
            VStack(spacing:0){
                Hero() .padding()
                    .background(Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1)))
                    .frame(maxWidth: .infinity, maxHeight: 360)
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Search Text", text: $searchText)
                    
                }
                .padding()
                .background(Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1)))
                .frame(maxWidth: .infinity)
                .textFieldStyle(.roundedBorder)
            }.padding()
            Text("ORDER FOR DELIVERY!")
                .font(.title)
            //.foregroundColor(.highlightColor2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Toggle("Starters", isOn: $startersIsEnabled)
                    Toggle("Mains", isOn: $mainsIsEnabled)
                    Toggle("Desserts", isOn: $dessertsIsEnabled)
                    Toggle("Drinks", isOn: $drinksIsEnabled)
                }
                // .buttonStyle(CategoryButton())
                .padding()
                .toggleStyle(.button)
                .tint(.gray)
                
                
            }
            
            
            FetchedObjects(predicate: buildPredicate(),
                           sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                
                List{
                    
                    ForEach(dishes) { dish in
                        
                        ItemDetails(dish: dish)
                        
                    }
                }.listStyle(.plain)
                
            }//end fetched object
            
            
        }.onAppear{
            if !loaded {
                getMenuData()
                loaded = true
            }
            
        }
        
    }//end body view
    
    func buildSortDescriptors() ->  [NSSortDescriptor] {
        
        return [NSSortDescriptor(key: "title",
                                 ascending: true,
                                 selector:
                                    #selector(NSString.localizedStandardCompare))]
        
    }// sort function
    
    func buildPredicate() -> NSCompoundPredicate {
        
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinksIsEnabled ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search,starters, mains, desserts, drinks])
        return compoundPredicate
    }//predicate func
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
