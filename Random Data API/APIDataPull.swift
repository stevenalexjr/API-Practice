//
//  APIDataPull.swift
//  Random Data API
//
//  Created by Steven Alexander on 3/22/23.
//

import Foundation
import SwiftUI

struct RandomAPI: Identifiable, Codable {
    let id: Int
    let uid, password, firstName, lastName: String
    let username, email: String
    let avatar: URL
    let gender, phoneNumber, socialInsuranceNumber, dateOfBirth: String
    let employment: Employment
    let address: Address
    let creditCard: CreditCard
    let subscription: Subscription
    

    
}

struct Address: Codable {
    let city, streetName, streetAddress, zipCode: String
    let state, country: String
    let coordinates: Coordinates


    
}

struct Coordinates: Codable {
    let lat, lng: Double
}

struct CreditCard: Codable {
    let ccNumber: String

   
}

struct Employment: Codable {
    let title, keySkill: String

    
    
}

struct Subscription: Codable {
    let plan, status, paymentMethod, term: String

    }

@MainActor
class RandomModel: ObservableObject {
    @Published var api : [RandomAPI] = []
    
    func reload() async {
        let url = URL(string: "https://random-data-api.com/api/v2/users?size=10")!
        let urlSession = URLSession.shared
        
        do {
            let (data, response) = try await urlSession.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            self.api = try decoder.decode([RandomAPI].self, from:data)
        }
        catch {
            
            debugPrint("Error Loading \(url): \(String(describing: error))")
        }
    }
}
