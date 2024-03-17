//
//  WeatherManager.swift
//  weather-app
//
//  Created by Ananda Afryan on 16/03/24.
//

import Foundation


class WeatherManager {
    func getCurrentWeather(city: String) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=38ad1eb9c990a829f3423c818094bff0&units=metric") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, res) = try await URLSession.shared.data(for: urlRequest)
        
        guard (res as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}
