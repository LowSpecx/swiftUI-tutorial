//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Maurice Tin on 20/06/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
