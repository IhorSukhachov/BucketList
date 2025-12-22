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
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
