//
//  ContentView.swift
//  iExpense
//
//  Created by Joseph Langat on 07/06/2023.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    var body: some View{
        VStack {
            Text("Hallo: \(name)")
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}
class User: ObservableObject {
   @Published var firstname = "Arap"
   @Published var lastname = "Ketung"
}
struct ContentView: View {
    @State private var showingSheet = false
    @StateObject var user = User()
    var body: some View {
        VStack {
            Button("Show second view"){
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "@twoChains")
            }
            Text("Your name is: \(user.firstname) \(user.lastname)")
            TextField("First Name", text: $user.firstname)
            TextField("Last Name", text: $user.lastname)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
