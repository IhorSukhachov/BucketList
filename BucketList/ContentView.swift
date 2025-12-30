//
//  ContentView.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 22.12.2025.
//

import MapKit
import SwiftUI


struct ContentView: View {
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(viewModel.locations) { location in
                    Annotation (location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                            .onTapGesture {
                                viewModel.selectedPlace = location
                            }
                    }
                }
            }
                .mapStyle(.hybrid)
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                        viewModel.locations.append(newLocation)
                    }
                    
                }.sheet(item: $viewModel.selectedPlace) { place in
                    EditView(location: place) {newLocation in
                        if let index = viewModel.locations.firstIndex(of: place) {
                            viewModel.locations[index] = newLocation
                        }
                    }
                }
                
        }

    }
}

#Preview {
    ContentView()
}
