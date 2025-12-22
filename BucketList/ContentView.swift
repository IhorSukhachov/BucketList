//
//  ContentView.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 22.12.2025.
//

import SwiftUI

struct User: Comparable, Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "Ihor", lastName: "Sukhachov"),
        User(firstName: "Andrii", lastName: "Kozlov"),
        User(firstName: "Oleg", lastName: "Shevchenko"),
    ].sorted()
    
    var body: some View {
        VStack {
            List(users) {user in
                Text("\(user.firstName) \(user.lastName)")
            }
            Button("Read and write") {
                let data = Data("Hello, world!".utf8)
                let url = URL.documentsDirectory.appending(path: "message.txt")
                
                do {
                    try data.write(to: url, options: [.atomic, .completeFileProtection])
                    let input = try String(contentsOf: url, encoding: .utf8)
                    print(input)
                    
                } catch {
                    print("error: \(error.localizedDescription)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
