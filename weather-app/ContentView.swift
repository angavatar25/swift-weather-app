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
    @StateObject var darkModeState = DarkModeToggle()

    var weatherManager = WeatherManager()

    @State var weather: ResponseBody?
    
    let grayColour = Color(red: 253/255.0, green: 252/255.0, blue: 251/255.0)
    let blackColour = Color(red: 47/255.0, green: 53/255.0, blue: 66/255.0)
    
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
    }
}

#Preview {
    ContentView(currentCity: "")
}
