//
//  EditView.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 24.12.2025.
//

import SwiftUI

struct EditView: View {
    enum LoadingState {
        case loading, loaded, failed
    }
    @Environment(\.dismiss) var dismiss
    var location: Location
    
    @State private var name: String
    @State private var description: String
    
    var onSave: (Location) ->Void
    
    @State private var loadingState: LoadingState = .loading
    @State private var pages = [Page]()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text:  $name)
                    TextField("Description", text: $description)
                }
                
                Section("Nearby") {
                     switch loadingState {
                         
                    case .loading:
                        Text("Loading...")
                         
                    case .loaded:
                         ForEach(pages, id:\.pageid) { page in
                            Text(page.title)
                                 .font(.headline)
                             + Text(":  ") +
                             Text("Page description here")
                                 .italic()
                        }
                    case .failed:
                        Text("Failed to load data")
                    }
                }
            }
            .navigationTitle("Place details ")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    onSave(newLocation)
                    dismiss()
                }
                
            }
        }
    }
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}


#Preview {
    EditView(location: .example) {_ in}
}
