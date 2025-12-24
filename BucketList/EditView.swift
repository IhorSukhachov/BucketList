//
//  EditView.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 24.12.2025.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    
    @State private var name: String
    @State private var description: String
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text:  $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Place details ")
            .toolbar {
                Button("Save") {
                    dismiss()
                }
                
            }
        }
    }
}

#Preview {
    EditView()
}
