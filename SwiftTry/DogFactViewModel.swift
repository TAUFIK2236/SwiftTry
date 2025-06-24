//
//  DogFactViewModel.swift
//  SwiftTry
//
//  Created by Anika Tabasum on 6/24/25.
//

import Foundation
import Combine
class DogFactViewModel: ObservableObject {
    @Published var fact: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func fetchFact() {
        isLoading = true
        errorMessage = nil
        guard let url = URL(string:"https://dogapi.dog/api/v2/facts")else{
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url){
            data , response , error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error{
                    self.errorMessage = error.localizedDescription
                    return
                }
                guard  let data = data else {
                    self.errorMessage = "No Data received"
                    return
                }
                do{
                    let decoded = try JSONDecoder().decode(DogFactResponde.self, from:data)
                    self.fact = decoded.data.first?.attributes.body ?? "No fact found"}catch{
                        self.errorMessage = "Failed to decode JSON"
                    }
             }
        }.resume()
        }
    }
    
    

