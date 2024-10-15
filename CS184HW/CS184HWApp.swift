//
//  CS184HWApp.swift
//  CS184HW
//
//  Created by Tommy So on 10/14/24.
//

import SwiftUI
import Firebase

@main
struct CS184HWApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
