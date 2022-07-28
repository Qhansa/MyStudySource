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
    
    // MARK - 1.2 CORE DATA: MAKE AN INSTANCE OF THE STUDYSOURCEVIEWMODEL
    /// To View The Model: Rather than making every view try and make their own store and  try to the data independently or once the app launches, and then store inside the SwiftUI environment. We inject it into the environment so everywhere else in out app can use it.
    @StateObject private var studySourceViewModel = StudySourceViewModel()

    var body: some Scene {
        WindowGroup {
//            ContentView()
            // MARK - 1.3 CORE DATA: PUT THE INSTANCE OF THE STUDYSOURCEVIEWMODEL INTO THE SWIFTUI ENVIRONMENT BY ADDING A NEW MODIFIER TO THE STUDYSOURCELISTVIEW.SWIFT
//                .environment(\.managedObjectContext, studySourceViewModel.container.viewContext)
            /// CODE EXPLANATION
            /// - `.managedObjectContext`: this is the live versions of your data when you load data and you change data somehow, those only exist in memory, until you specifically say "I'm done know, write it back to the persistent store, to the iPhone ssd , whatever you're using right"
            /// - `.viewContect`: So the job for ViewContent is to let us work with data in memory which is much faster than working within on disk all the time alyways reeading and writing objects. So we'll load it once work with the memory modify as much as you want tto, and then write out only when you're ready.
            /// - when you're ready, you still have to write it out. you can decide not to, you could say actually you know forget those changes discard them -- don't write them. But if you do want to write them you say save. (Go to `StudySourceViewModel.swift`)
            /// - And then inject the `.environment`
            
            /// If you do want to write then you say save.
            ///
            ///
            // MARK - 1.4 CORE DATA: READING DATA AND WRITING IT TOO
            /// Reading data with Core Data is done with what's called effect request. We describe what we want, how much we sorted/filtered.
            /// And then Core Data sends us back  all the matching data for us to use.
            ///
            /// Now we've got to make sure this fetch request stays up to date over time. So as soon objects are creatend or removed our UI stays sycnhrozied.
            ///
            /// Now SwiftUI has a solution for this and it's another property wrapper, this time it's called `@FetchRequest` and takes at least one parameter describing "How we want sorting to happen?". It has quite a specific format. --> Go to `ContentView.swift` file.
            
            
            NavigationView {
                StudySourceListView()
                Text("Select a StudySource")
//                    .foregroundColor(Color("ColorDarkChoco"))
                    .foregroundColor(.secondary)
            }
            .environmentObject(studySourceViewModel)
        }
    }
}
