//
//  MyStudySourceApp.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 25/07/22.
//

import SwiftUI

@main
struct MyStudySourceApp: App {
//    let persistenceController = PersistenceController.shared
//    @StateObject private var studyData = StudySourceData()

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            NavigationView {
//                StudySourceData()
                Text("Select a StudySource")
                    .foregroundColor(UIColor(named: "ColorDarkChoco"))
            }.environmentObject(studyData)
        }
    }
}
