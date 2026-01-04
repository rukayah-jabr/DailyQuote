//
//  DailyQuoteApp.swift
//  DailyQuote
//
//  Created by rukayah on 21.10.25.
//

import SwiftUI
import SwiftData

@main
struct QuoteAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                QuoteView()
                    .tabItem {
                        Label("Heute", systemImage: "text.quote")
                    }

                FavoritesView()
                    .tabItem {
                        Label("Favoriten", systemImage: "star.fill")
                    }
            }
            .modelContainer(for: Quote.self)
        }
    }
}
