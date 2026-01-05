//
//  DailyQuoteApp.swift
//  DailyQuote
//
//  Created by rukayah on 21.10.25.
//

import SwiftUI
import SwiftData
import UserNotifications

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
            .onAppear { UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
                if granted {
                    print("Benachrichtigungen erlaubt")
                    scheduleDailyQuoteNotification()
                } else {
                    print("Benachrichtigungen abgelehnt")
                }
            }
            }
        }
    }
}


func scheduleDailyQuoteNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Zitat des Tages"
    content.body = "Dein neues Zitat ist da!"
    content.sound = .default

    // Jeden Tag um 7:00 Uhr
    var dateComponents = DateComponents()
    dateComponents.hour = 7
    dateComponents.minute = 0

    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

    let request = UNNotificationRequest(identifier: "dailyQuote", content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request)
}
