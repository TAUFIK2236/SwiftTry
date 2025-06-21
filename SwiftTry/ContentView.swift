//
//  ContentView.swift
//  SwiftTry
//
//  Created by Anika Tabasum on 6/12/25.
//

import SwiftUI

enum Category : String, CaseIterable,Identifiable{
    case mountain = "Mountain",historical = "Historical",beach = "Beach", city = "City"
    var id: String {rawValue}
}
struct Destination1: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let country: String
}
let destinationByCategory: [Category:[Destination1]]=[
    .mountain : [.init(image:"uluru", title:"Uluru", country:"Australia"),
                 .init(image: "matterhorn", title:"Matterhorn", country: "Switzerland")],
    .historical:[.init(image: "machu", title:"Machu Picchu", country:"Peru")],
    .beach:[.init(image:"bali", title:"Bali", country:"Indonesia")],
    .city:[.init(image: "newyork", title:"New York", country:"USA")]
]

struct ContentView: View {
    var body: some View {
        TabView{
            
            HomePage()
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
        
        Color.blue.opacity(0.15)
            .ignoresSafeArea()
            CloneView()
            .tabItem{
                Image(systemName:"map.fill")
                Text("Map")
            }
        Color.blue.opacity(0.15)
            .ignoresSafeArea()
            SwipeDemoView()
            .tabItem{
                Image(systemName:"heart")
                Text("saved")
                
            }
            
        }
    
    }
}

struct HomePage:View {
    @State private var catagory:Category = .mountain
    
    private func iconName(for cat : Category) -> String{
        switch cat {
        case .mountain:"mountain.2.fill"
            
        case .historical:
            "hourglass"
        case .beach:
            "sun.max.fill"
        case .city:
            "building.2.fill"
        }
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            VStack(alignment: .leading, spacing: 4){
                Text("Travel").font(.largeTitle.bold())
                Text("Where do you want to go?").font(.subheadline).foregroundColor(.secondary)
            }.padding()
            Picker("Catagory", selection: $catagory){
                ForEach(Category.allCases){cat in Label(
                    title:{Text(cat.rawValue)},
                    icon:{Image(systemName:iconName(for: cat))
                    }
                ).tag(cat)
                }
            }
            .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom,8)
            Text("Choose your destination")
                .font(.headline)
                .padding(.horizontal)
                .padding(.bottom,4)
            TabView{
                ForEach(destinationByCategory[catagory] ?? []){
                    place1 in DestinationCard1(place2:place1)
                        .padding(.vertical,40)
                        .background(Color.brown)
                        .frame(width: 300,height: 320)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                }
            }
            .tabViewStyle(.page(indexDisplayMode:.automatic))
            
            
            
            Spacer()
        }
    }
}
private struct DestinationCard1:View {
    let place1:Destination1
    init(place2: Destination1) {
        self.place1 = place2
    }
    
    var body: some View {
        VStack(spacing:12){
            Image(place1.image)
                .resizable()
                .scaledToFill()
                .frame(width: 240,height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 22))
            Text(place1.title)
                .font(.title3.bold())
            Text(place1.country)
                .font(.title3.bold())
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
                
        }
    }

    


#Preview {
    ContentView()
        .environment(\.colorScheme,.light)
}
