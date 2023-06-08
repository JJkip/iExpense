//
//  ContentView.swift
//  iExpense
//
//  Created by Joseph Langat on 07/06/2023.
//

import SwiftUI

struct UserB: Codable {
    let firstName: String
    let lastName: String
}

struct FifthVIew: View {
    @State private var user = UserB(firstName: "David", lastName: "Kipbet")
    var body: some View{
        Button("Save User"){
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user){
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ForthView: View {
    @AppStorage("tapCount") private var tapCount = 0
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View{
        Button("Tap count: \(tapCount)"){
            tapCount += 1
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

struct ThirdView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    var body: some View{
        NavigationView {
            VStack{
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row: \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                Button("Add number"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("On Delete")
            .toolbar{
                EditButton()
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

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
        VStack(spacing:20) {
            Button("Storing data with codable"){
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet){
                FifthVIew()
            }
            Button("Storing User settings/data View"){
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet){
                ForthView()
            }
            Button("Show Deleting Data View") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                ThirdView()
            }
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
