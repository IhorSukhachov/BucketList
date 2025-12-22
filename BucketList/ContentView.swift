//
//  ContentView.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 22.12.2025.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    let users = [
        User(firstName: "Ihor", lastName: "Sukhachov"),
        User(firstName: "Andrii", lastName: "Kozlov"),
        User(firstName: "Oleg", lastName: "Shevchenko"),
    ].sorted {
        $0.lastName < $1.lastName
    }
    
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
