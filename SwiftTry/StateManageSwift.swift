//
//  StateManageSwift.swift
//  SwiftTry
//
//  Created by Anika Tabasum on 6/23/25.
//

import SwiftUI
import Combine

class NameViewModel:ObservableObject{
    @Published var name1 : String=""
}

class CounterModel:ObservableObject{
    @Published var count = 0
    func increment(){
        count += 1
    }
}
class UserSettings: ObservableObject{
    @Published var username : String = "Guest"
}




struct StateManageSwift: View {
    
    
    @State private var count = 0
    @State private var isOn = false
    
    @ObservedObject var viewModel:NameViewModel
    @StateObject private var viewModel1 = CounterModel()
    @StateObject private var settings = UserSettings()
    
    var body: some View {
        VStack(spacing:20){
            
            
            Text("Count:\(count)")
                .font(.largeTitle)
            Button("Increase"){
                count += 1
            }
            Text("Switch is \(isOn ?"On":"OFF")").font(.title)
            
            ToggleSwitch(isOn:$isOn)
            
            Text("Hellow, \(viewModel.name1)")
            
            TextField("Enter your name",text:$viewModel.name1).textFieldStyle(.roundedBorder).padding()
            
            Text("Counter \(viewModel1.count)")
            Button("Add 1"){viewModel1.increment()}
            justSimpleView().environmentObject(settings)

        }
    }
}

struct ToggleSwitch:View {
    @Binding var isOn:Bool
    var body: some View {
        Toggle("Toggle me",isOn: $isOn)
    }
}

#Preview {
    StateManageSwift(viewModel: NameViewModel())
        
}

struct justSimpleView: View {
    @EnvironmentObject var settings:UserSettings
    var body: some View {
        
        Text("Username : \(settings.username)").font(.title)
        TextField("Edit username",text:$settings.username)
            .textFieldStyle(.roundedBorder)
    }
}
