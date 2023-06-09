//
//  ContentView.swift
//  iExpense
//
//  Created by Joseph Langat on 07/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var numberItem = 1
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test: \(numberItem)", type: "Personal", amount: 5)
                    numberItem += 1
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
