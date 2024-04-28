//
//  IDineApp.swift
//  IDine
//
//  Created by Robinson Thairu on 16/04/2024.
//

import SwiftUI

@main
struct IDineApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
