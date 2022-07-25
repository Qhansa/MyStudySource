//
//  MyStudySourceApp.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 25/07/22.
//

import SwiftUI

@main
struct MyStudySourceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
