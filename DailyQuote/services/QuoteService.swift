//
//  QuoteService.swift
//  DailyQuote
//
//  Created by rukayah on 21.10.25.
//

import Foundation

class QuoteService {
    func fetchQuoteOfTheDay(completion: @escaping (Quote?) -> Void) {
        guard let url = URL(string: "https://favqs.com/api/qotd") else { return }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let decoded = try JSONDecoder().decode(QOTDResponse.self, from: data)
                let quote = Quote(body: decoded.quote.body, author: decoded.quote.author)
                DispatchQueue.main.async {
                    completion(quote)
                }
            } catch {
                completion(nil)
            }
        }.resume()
    }
}

struct QOTDResponse: Codable {
    let quote: QuoteData
}

struct QuoteData: Codable {
    let body: String
    let author: String
}
