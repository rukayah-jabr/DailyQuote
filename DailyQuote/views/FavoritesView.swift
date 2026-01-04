//
//  FavoritesView.swift
//  DailyQuote
//
//  Created by rukayah on 04.01.26.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query(sort: \Quote.body) var favorites: [Quote]

    var body: some View {
        List(favorites) { quote in
            VStack(alignment: .leading, spacing: 6) {
                Text("„\(quote.body)“")
                    .font(.headline)

                Text("- \(quote.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Favoriten")
    }
}
