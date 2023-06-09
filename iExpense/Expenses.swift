//
//  Expenses.swift
//  iExpense
//
//  Created by Joseph Langat on 09/06/2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
