//
//  CityListView.swift
//  weather-app
//
//  Created by Ananda Afryan on 16/03/24.
//

import SwiftUI

struct City: Identifiable {
    var id = UUID()
    var name: String
}

struct CityListView: View {
    let currentCity: String

    init (currentCity: String) {
        self.currentCity = currentCity
    }

    let cities = [
        City(name: "London"),
        City(name: "Seoul"),
        City(name: "Pyongyang"),
        City(name: "Shanghai"),
        City(name: "Berlin"),
        City(name: "Kuala Lumpur"),
        City(name: "Dublin"),
    ]
    var body: some View {
        NavigationView {
            VStack {
                Text("Choose a city").font(.headline)
                List(cities) { city in
                    NavigationLink(destination: ContentView(currentCity: city.name)) {
                        Text(city.name)
                    }
                }.listStyle(InsetGroupedListStyle())
            }
        }
    }
}

#Preview {
    CityListView(currentCity: "London")
}
