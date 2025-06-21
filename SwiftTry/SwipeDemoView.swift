//
//  SwipeDemoView.swift
//  SwiftTry
//
//  Created by Anika Tabasum on 6/17/25.
//

import SwiftUI

struct Destination: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let country: String
}
let samplePlace:[Destination] = [
    Destination(image:"bali", title: "Bali", country: "INdonasia"),
    Destination(image:"uluru", title: "Uluru", country: "INdonasia"),
    Destination(image:"newyork", title: "New York", country: "INdonasia")
]

struct DestinationCard:View {
    let place: Destination
    
    var body: some View {
        VStack(spacing: 12){
            Image(place.image)
                .resizable()
                .scaledToFill()
                .frame(width: 240 ,height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 22))
            Text(place.title)
                .font(.title3.bold())
            Text(place.country)
                .font(.footnote)
                .foregroundColor(.secondary)
            
        }
        .frame(maxWidth:.infinity)
    }
}

struct SwipeDemoView: View {
    var body: some View {
        VStack(spacing:20){
            Text("Swipe the card")
                .font(.largeTitle.bold())
            TabView{
                ForEach(samplePlace){ place in
                    DestinationCard(place:place)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .frame(height: 320)
            
        }
        .padding()
    }
}

#Preview {
    SwipeDemoView()
}
