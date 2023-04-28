//
//  TuniFyApp.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 13/4/2023.
//

import SwiftUI

@main
struct TuniFyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CartView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
