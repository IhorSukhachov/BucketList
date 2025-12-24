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
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition)
                .mapStyle(.hybrid)
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        print("Tapped at \(coordinate)")
                    }
                    
                }
        }

    }
}

#Preview {
    ContentView()
}
