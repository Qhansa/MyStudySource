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
    /// To View The Model
    @StateObject private var studySourceViewModel = StudySourceViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.managedObjectContext, studySourceViewModel.container.viewContext)
            NavigationView {
//                StudySourceData()
                Text("Select a StudySource")
                    .foregroundColor(Color("ColorDarkChoco"))
            }
//            .environmentObject(studyData)
        }
    }
}
