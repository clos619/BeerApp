//
//  BeerAppApp.swift
//  BeerApp
//
//  Created by Field Employee on 1/20/21.
//

import SwiftUI

@main
struct BeerAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SignIn()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
