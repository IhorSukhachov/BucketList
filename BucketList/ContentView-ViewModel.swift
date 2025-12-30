//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 30.12.2025.
//

import CoreLocation
import Foundation
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var locations = [Location]()
        var selectedPlace : Location?
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
        }
        
        func updateLocation(location: Location) {
            guard let selectedPlace else { return }
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }
    }
}

