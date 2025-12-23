//
//  ContentView.swift
//  BucketList
//
//  Created by Ihor Sukhachov on 22.12.2025.
//
import LocalAuthentication
import SwiftUI


struct ContentView: View {
    
    @State private var isUnlock: Bool = false
    
    var body: some View {
        VStack {
            if isUnlock {
                Text("is unlocked")
            }
            else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    func authenticate() {
         let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authentificationError in
                if success {
                    isUnlock = true
                } else {
                     //pronlem
                }
                 
            }
        }
        else {
            //no bio
        }
    }
}

#Preview {
    ContentView()
}
