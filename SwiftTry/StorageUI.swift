//
//  StorageUI.swift
//  SwiftTry
//
//  Created by Anika Tabasum on 6/24/25.
//

import SwiftUI

struct StorageUI: View {
    @AppStorage("MyAnimal") var favoriteAnimal:String = "Cat"
    @State private var name: String = ""
    
    var body: some View {
        VStack(spacing:20){
            Text("My favorite animal name is : \(favoriteAnimal)")
            Text(favoriteAnimal).font(.largeTitle)
            TextField("Enter the favorite animalname",text: $favoriteAnimal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Type your name and save it")
            TextField("Enter name",text:$name).textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save Name"){
                UserDefaults.standard.set(name, forKey:"MyName")
            }
            Button("Load Name"){
                name = UserDefaults.standard.string(forKey:"MyName") ?? ""
            }
        }
    }
}

#Preview {
    StorageUI()
}

