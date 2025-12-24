//
//  Quote.swift
//  DailyQuote
//
//  Created by rukayah on 21.10.25.
//

import Foundation

struct Quote: Identifiable, Codable {
    let id: UUID = UUID()
    let body: String
    let author: String
}
