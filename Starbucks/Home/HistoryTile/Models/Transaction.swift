//
//  Transaction.swift
//  HistoryView
//
//  Created by Andrea Yong on 11/1/24.
//

import Foundation

struct Transaction: Codable {
    let id : Int
    let type : String
    let amount : String
    let date : Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case amount
        case date = "processed_at"
    }
}
