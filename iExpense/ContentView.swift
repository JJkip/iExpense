//
//  ContentView.swift
//  iExpense
//
//  Created by Joseph Langat on 07/06/2023.
//

import SwiftUI

class User: ObservableObject {
   @Published var firstname = "Arap"
   @Published var lastname = "Ketung"
}
struct ContentView: View {
    @StateObject var user = User()
    var body: some View {
        VStack {
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
