//
//  ContentView.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 22.12.2025.
//
import MapKit
import SwiftUI

//struct LoadingView: View {
//    var body: some View {
//        Text("Loading...")
//    }
//}
//
//struct SuccessView: View {
//    var body: some View {
//        Text("Success!")
//    }
//}
//
//struct FailedView: View {
//    var body: some View {
//        Text("Failed.")
//    }
//}


struct ContentView: View {
//    enum LoadingState {
//        case loading, success, failed
//    }
//    
//    @State private var loadingState: LoadingState = .loading
    let position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1278),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    )
    
    var body: some View {
        VStack {
            Map(initialPosition: position)
                .mapStyle(.hybrid(elevation: .realistic))
////            if loadingState == .loading {
////                LoadingView()
////            } else if loadingState == .success {
////                SuccessView()
////            } else if loadingState == .failed {
////                FailedView()
////            }
//            
//            switch loadingState {
//            case .loading:
//                LoadingView()
//            case .success:
//                SuccessView()
//            case .failed:
//                FailedView()
//            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
