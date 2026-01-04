//
//  QuoteView.swift
//  DailyQuote
//
//  Created by rukayah on 21.10.25.
//


import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel = QuoteViewModel()
    @Environment(\.modelContext) private var modelContext

    
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
            // Pfeil button
            Button{
                viewModel.loadQuoteOfTheDay()
            } label: {
                Image(systemName: "arrow.right.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
            }
            .padding(.top, 30)
            
            // Speichern button
            Button {
                viewModel.saveFavorite(modelContext: modelContext)
            } label: {
                Image(systemName: "star.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.yellow)
            }

            
        } .padding()
            .onAppear { //automatsich beim Öffnen der App
                viewModel.loadQuoteOfTheDay()
            }
    }
}
