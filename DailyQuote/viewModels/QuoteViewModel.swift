//
//  QuoteViewModel.swift
//  DailyQuote
//
//  Created by rukayah on 21.10.25.
//

import Foundation

@MainActor
class QuoteViewModel: ObservableObject {
    @Published var quote: Quote?
    @Published var isLoading = false

    private let service = QuoteService()

    func loadQuoteOfTheDay() {
        isLoading = true
        service.fetchQuoteOfTheDay { [weak self] result in
            self?.quote = result
            self?.isLoading = false
        }
    }
}
