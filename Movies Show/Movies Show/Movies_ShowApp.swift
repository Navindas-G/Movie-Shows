//
//  Movies_ShowApp.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 28/11/23.
//

import SwiftUI

@main
struct Movies_ShowApp: App {
    @StateObject var networkMonitor = NetworkMonitor.shared
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MovieListView()
            }
            .environmentObject(networkMonitor)
        }
    }
}
