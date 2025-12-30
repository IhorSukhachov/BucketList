//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 30.12.2025.
//

import Foundation
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        var locations = [Location]()
        var selectedPlace : Location?
    }
}

