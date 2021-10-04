//
//  HVACWORKSApp.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 1/24/21.
//

import SwiftUI

@main
struct HVACWORKSApp: App {
    @StateObject var controlCenter = UserControlCenter()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeTabView()
                    .environmentObject(controlCenter)
            }
        }
    }
}
