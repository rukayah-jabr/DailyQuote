//
//  Quote.swift
//  DailyQuote
//
//  Created by rukayah on 21.10.25.
//

import Foundation
import SwiftData

@Model
class Quote {
    @Attribute(.unique) var id: UUID
    var body: String
    var author: String

    init(id: UUID = UUID(), body: String, author: String) {
        self.id = id
        self.body = body
        self.author = author
    }
}
