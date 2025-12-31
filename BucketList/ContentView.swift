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
    @State private var mapStyle: MapStyle = .standard
    
    var body: some View {
        if viewModel.isUnlocked {
            NavigationStack {
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
                        .mapStyle(mapStyle)
                        .onTapGesture { position in
                            if let coordinate = proxy.convert(position, from: .local) {
                                viewModel.addLocation(at: coordinate)
                            }
                            
                        }.sheet(item: $viewModel.selectedPlace) { place in
                            EditView(location: place) {
                                viewModel.updateLocation(location: $0)
                            }
                        }
                        
                }.toolbar {
                    Button("Standart map") {
                        mapStyle = .standard
                    }
                    Button("Satellite map") {
                        mapStyle = .hybrid
                    }

                }
            }

            

        }
        else {
            Button("Unlock places", action: viewModel.authencticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }


    }
}

#Preview {
    ContentView()
}
