//
//  BeerAppApp.swift
//  BeerApp
//
//  Created by Field Employee on 1/20/21.
//

import SwiftUI
import Firebase

@main
struct BeerAppApp: App {
    let persistenceController = PersistenceController.shared
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            SignIn()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
