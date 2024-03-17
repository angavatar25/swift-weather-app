//
//  DarkModeToggle.swift
//  weather-app
//
//  Created by Ananda Afryan on 17/03/24.
//

import Foundation
import SwiftUI

class DarkModeToggle: ObservableObject {
    @Published var colorScheme: ColorScheme = .light
    
    init() {
        let notificationNameColorScheme = NSNotification.Name("ColourDidChangedNotification")
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateColorScheme), name: notificationNameColorScheme, object: nil)
    }
    
    @objc func updateColorScheme() {
        self.colorScheme = UIScreen.main.traitCollection.userInterfaceStyle == .dark ? .dark : .light
    }
}
