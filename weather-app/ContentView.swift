//
//  ContentView.swift
//  weather-app
//
//  Created by Ananda Afryan on 15/03/24.
//

import SwiftUI

struct VerticalLine: View {
    let height: CGFloat
    let color: Color
    
    init(height: CGFloat, color: Color) {
        self.height = height
        self.color = color
    }
    var body: some View {
        Rectangle()
            .frame(width: 1, height: height) // Adjust the width and height as needed
            .foregroundColor(color) // Set the color of the line
    }
}

func singleDigitFormatted(num: Double) -> String {
    return String(format: "%.1f", num)
}

struct ContentView: View {
    let grayColour = Color(red: 253/255.0, green: 252/255.0, blue: 251/255.0);
    var weatherManager = WeatherManager()

    @State var weather: ResponseBody?
    
    let currentCity: String
    
    init(currentCity: String) {
        self.currentCity = currentCity
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            if (currentCity == "") {
                CityListView(currentCity: currentCity)
            } else if let weather = weather {
                WeatherView(weather: weather)
            } else {
                LoadingView()
                    .task {
                        do {
                            weather = try await weatherManager.getCurrentWeather(city: currentCity)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
            }
        }
        .background(grayColour)
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView(currentCity: "")
}
