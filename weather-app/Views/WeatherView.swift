//
//  WeatherView.swift
//  weather-app
//
//  Created by Ananda Afryan on 16/03/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var darkModeState = DarkModeToggle()
    
    @Environment(\.colorScheme) var colorScheme
    
    let blackColour = Color(red: 47/255.0, green: 53/255.0, blue: 66/255.0)
    let grayColour = Color(red: 253/255.0, green: 252/255.0, blue: 251/255.0)

    let weather: ResponseBody
    
    init(weather: ResponseBody) {
        self.weather = weather
    }

    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Text(weather.name)
                    .font(.system(size: 30))
                    .fontWeight(.light)
                Text("Monday 7:00 AM")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
            }
            Spacer()
            VStack {
                Image(systemName: "cloud.sun.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 100))
            }
            Spacer()
            VStack(spacing: 10) {
                Text("\(singleDigitFormatted(num: weather.main.feelsLike))°C")
                    .font(.system(size: 50))
                VStack {
                    Text("Good Morning")
                        .textCase(.uppercase)
                        .foregroundColor(.gray)
                }
            }
            Divider()
                .frame(width:50)
                .padding(20)
                .foregroundColor(.gray)
            HStack(spacing: 30) {
                VStack(spacing: 10) {
                    Image(systemName: "sun.horizon")
                        .font(.system(size: 25))
                    VStack {
                        Text("Sunrise")
                            .textCase(.uppercase)
                            .font(.system(size: 10))
                        Text("7.00")
                            .font(.system(size: 20))
                    }
                }
                VerticalLine(height: 50, color: Color.gray)
                VStack(spacing: 10) {
                    Image(systemName: "wind")
                        .font(.system(size: 25))
                    VStack {
                        Text("Wind")
                            .textCase(.uppercase)
                            .font(.system(size: 10))
                        Text("\(singleDigitFormatted(num: weather.wind.speed))m/s")
                            .font(.system(size: 20))
                    }
                }
                VerticalLine(height: 50, color: Color.gray)
                VStack(spacing: 10) {
                    Image(systemName: "thermometer.transmission")
                        .font(.system(size: 25))
                    VStack {
                        Text("Temperature")
                            .textCase(.uppercase)
                            .font(.system(size: 10))
                        Text("\(singleDigitFormatted(num: weather.main.feelsLike))°C")
                            .font(.system(size: 20))
                    }
                }

            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .preferredColorScheme(.dark)
        .foregroundColor(colorScheme == .dark ? .white : .black)
        .background(colorScheme == .dark ? blackColour : grayColour)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
        .preferredColorScheme(.dark)
}
