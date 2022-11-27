//
//  sklepApp.swift
//  sklep
//
//  Created by user224043 on 11/27/22.
//

import SwiftUI

@main
struct sklepApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
