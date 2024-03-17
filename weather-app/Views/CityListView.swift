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
    @StateObject var darkModeState = DarkModeToggle()
    
    let blackColour = Color(red: 47/255.0, green: 53/255.0, blue: 66/255.0)
    let grayColour = Color(red: 253/255.0, green: 252/255.0, blue: 251/255.0)

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
        City(name: "Jakarta")
    ]
    var body: some View {
        NavigationView {
            VStack {
                Text("Choose a city")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                List(cities) { city in
                    NavigationLink(destination: ContentView(currentCity: city.name)) {
                        Text(city.name)
                    }
                }.listStyle(InsetGroupedListStyle())
            }
        }
        .preferredColorScheme(.dark)
        .background(darkModeState.colorScheme == .dark ? blackColour : grayColour)
    }
}

#Preview {
    CityListView(currentCity: "London")
        .preferredColorScheme(.dark)
}
