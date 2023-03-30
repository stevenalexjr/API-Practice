//
//  ContentView.swift
//  Countries
//
//  Created by Steven Alexander on 3/22/23.
//

import SwiftUI

struct CountriesView: View {
    @StateObject var countriesModel = CountriesModel()
    
    var body: some View {
        List(countriesModel.countries) { country in
                Text(country.name)
            }
            .task {
                await self.countriesModel.reload()
            }
            .refreshable {
                await self.countriesModel.reload()
            }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
