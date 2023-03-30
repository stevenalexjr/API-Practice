//
//  Country.swift
//  Countries
//
//  Created by Steven Alexander on 3/22/23.
//

import Foundation
import SwiftUI

struct Country: Identifiable, Codable {
    var id: String
    var name: String

//    static let allCountries = [
//        Country(id: "be", name: "Belgium"),
//        Country(id: "bg", name: "Bulgaria"),
//        Country(id: "el", name: "Greece"),
//        Country(id: "lt", name: "Lithuania"),
//        Country(id: "pt", name: "Portugal"),
//    ]
}

//The CountriesModel Class is loading and holding the data from our JSON file.
@MainActor
class CountriesModel: ObservableObject {
    @Published var countries : [Country] = []
    
    func reload() async {
        let url = URL(string: "https://www.ralfebert.de/examples/v3/countries.json")!
        let urlSession = URLSession.shared
        
        
        
        // Error Handling is here
        
        do {
            let (data, response) = try await urlSession.data(from: url)
            self.countries = try JSONDecoder().decode([Country].self, from:data)
        }
        catch {
            
            debugPrint("Error Loading \(url): \(String(describing: error))")
        }
    }
}
