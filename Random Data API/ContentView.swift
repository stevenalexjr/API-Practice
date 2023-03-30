//
//  ContentView.swift
//  Random Data API
//
//  Created by Steven Alexander on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var randomAPIs = RandomModel()
    
    var body: some View {
        VStack{
            List(randomAPIs.api) { model in
                VStack{
                    Text(model.firstName)
                    Text(model.lastName)
                    //Text(model.address.streetAddress)
                    Text(model.email)
                    Text(model.password)
                    //Text(model.employment.title)
                    AsyncImage(url: model.avatar)
                }
            }
        }
        .task {
            await self.randomAPIs.reload()
        }
        .refreshable {
            await self.randomAPIs.reload()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
