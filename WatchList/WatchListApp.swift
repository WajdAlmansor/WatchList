//
//  WatchListApp.swift
//  WatchList
//
//  Created by Wajd on 20/08/2025.
//

import SwiftUI
import SwiftData

@main
struct WatchListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}
