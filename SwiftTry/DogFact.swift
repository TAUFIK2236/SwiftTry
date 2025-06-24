//
//  DogFact.swift
//  SwiftTry
//
//  Created by Anika Tabasum on 6/24/25.
//

import Foundation

struct DogFactAttributes: Codable {
    let body: String
}


struct DogFact : Codable{
    let id: String
    let type : String
    let attributes : DogFactAttributes
}
struct DogFactResponde : Codable{
    let data:[DogFact]
}
