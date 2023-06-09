//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Joseph Langat on 09/06/2023.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
