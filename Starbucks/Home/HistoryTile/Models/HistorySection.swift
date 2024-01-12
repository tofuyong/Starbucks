//
//  HistorySection.swift
//  HistoryView
//
//  Created by Andrea Yong on 11/1/24.
//

import Foundation

struct HistorySection: Codable {
    let title: String
    let transactions: [Transaction]
}
