//
//  PropertyObserversApp.swift
//  PropertyObservers
//
//  Created by Shah Md Imran Hossain on 13/4/23.
//

import SwiftUI

@main
struct PropertyObserversApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(User())
        }
    }
}
