//
//  QuoteView.swift
//  DailyQuote
//
//  Created by rukayah on 21.10.25.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel = QuoteViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if viewModel.isLoading {
                ProgressView("Lade Zitat…")
            } else if let quote = viewModel.quote {
                Text("„\(quote.body)“")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()

                Text("- \(quote.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            } else {
                Text("Kein Zitat verfügbar.")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.loadQuoteOfTheDay()
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    print("Swipe detected: \(value.translation.width)")
                    if abs(value.translation.width) > 50 {
                        viewModel.loadQuoteOfTheDay()
                    }
                }
        )
        
    }
}
