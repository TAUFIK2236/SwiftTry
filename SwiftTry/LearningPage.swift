//
//  LearningPage.swift
//  SwiftTry
//
//  Created by Anika Tabasum on 6/22/25.
//

import SwiftUI
struct Profile: Identifiable {
    let id = UUID()
    let name: String
    let gender: String
    let birthday:Date
}

struct ProfileDetailView: View {
    let profile: Profile
    var body: some View {
        VStack(spacing:20){
            Text("Name: \(profile.name)")
            Text("Gender \(profile.gender)")
            Text("BirtDay: \(profile.birthday)")
        }
        .navigationTitle("Profile Detail")
        .padding()
    }
}


struct LearningPage: View {
    @State private var name = ""
    @State private var password = ""
    @State private var gender = ""
    @State private var isNotified = false
    @State private var birthdate = Date()
    @State private var profiles:[Profile] = []
    
    let genders = ["Male","Female","Others"]
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header:Text("Basic info")){
                    TextField("Enter your name",text: $name)
                    SecureField("Enter your password",text: $password)
                    
                    Divider()
                    Picker("Gender",selection: $gender){ ForEach(genders,id:\.self){option in Text(option)}}
                    Toggle("Enble Notifications",isOn: $isNotified)
                    DatePicker("Birthdate", selection:$birthdate, displayedComponents:.date)
                }
                Section{
                    Button("Save Profile"){
                        let newProfile = Profile(name:name, gender:gender,birthday:birthdate)
                        profiles.append(newProfile)
                        name = ""
                        password = ""
                    }
                }
                
                Section(header:Text("Saved Profiles")){
                    List(profiles){
                        profile in NavigationLink(destination:ProfileDetailView(profile:profile)){
                            VStack(alignment: .leading){
                                Text(profile.name)
                                Text("\(profile.birthday)")
                            }
                        }
                    }
                }
            }

        }
        
    }
}

#Preview {
    LearningPage()
}
