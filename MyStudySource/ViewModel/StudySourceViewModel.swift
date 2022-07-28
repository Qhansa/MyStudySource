//
//  StudySourceViewModel.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 26/07/22.
//

// MARK - 1.1 CORE DATA: LOAD THE CORE DATA
import Foundation
import CoreData
import SwiftUI

class StudySourceViewModel: ObservableObject {
    // MARK - 1.1a CORE DATA: CREATE A CONSTANT BY USING NSPersistentContainer
//    let container = NSPersistentContainer(name: "MyStudySource")
    /// NSPersistentContainer is the actual data being loaded and saved to the device.
    
    // MARK - 1.1b CORE DATA: LOAD THE MYSTUDYSOURCE.XDATAMODEL BY INITIALIZING
    /// At this point we've made our model on MyStudySource.xdatamodel, and we prepared it for using 50y by loading it.
//    init() {
//        container.loadPersistentStores {description, error in
            /// If any error happened
//            if let error = error {
//                print("Core Data Failed to load: \(error.localizedDescription)")
//            }
//        }
//    }
    
    
    //// ==============================================================================================
    @Published var studySources: [TheStudySource] = [
        // iOS Development Category
        TheStudySource(topic: "Core Data",
                       category: "iOS Development",
                       urls: [StudySourceURL(text: "https://youtu.be/O7u9nYWjvKk"),
                              StudySourceURL(text: "https://youtu.be/bvm3ZLmwOdU")],
                       notes: "Core Data is Like an SQL for iOS"),
        TheStudySource(topic: "Audio Player",
                       category: "iOS Development",
                       urls: [StudySourceURL(text: "https://developer.apple.com/documentation/avfaudio/avaudioplayer")],
                       notes: "Audio Player is Part of AVFoundation"),
        TheStudySource(topic: "MVVM",
                       category: "iOS Development",
                       urls: [StudySourceURL(text: "https://medium.com/geekculture/swiftui-mvvm-architecture-d00a29812d90"),
                              StudySourceURL(text: "https://www.hackingwithswift.com/books/ios-swiftui/introducing-mvvm-into-your-swiftui-project"),
                              StudySourceURL(text: "https://youtu.be/FwGMU_Grnf8")],
                       notes: "MVC is for UIKit, MVVM is for SwiftUI"),
        
        // Machine Learning Category
        TheStudySource(topic: "Sound Classification",
                       category: "Machine Learning",
                       urls: [StudySourceURL(text: "https://developer.apple.com/videos/play/wwdc2019/425/"),
                              StudySourceURL(text: "https://developer.apple.com/videos/play/wwdc2021/10036"),
                             ],
                       notes: "User CreateML to make Sound Classification")
    ]
    
    func delete(_ studySource: TheStudySource) {
        studySources.removeAll { $0.id == studySource.id }
    }
    
    func add(_ studySource: TheStudySource) {
        studySources.append(studySource)
    }
    
    func exists(_ studySource: TheStudySource) -> Bool {
        studySources.contains{ $0.id == studySource.id }
    }
    
//    func sortedStudySources(category: Category) -> Binding<[TheStudySource]> {
//        Binding<[TheStudySource]>(
//            get: {
//                self.studySources
//                    .filter {
//                        switch category {
//                        case .iOSDevelopment:
//                            return print("$0.isIOSDevelopment")
//                        case .MachineLearning:
//                            return print("$0.isMachineLearning")
//                        }
//                    }
//            },
//            set: { studySources in
//                for studySource in studySources {
//                    if let index = self.studySources.firstIndex(where: {$0.id == studySource.id}) {
//                        self.studySources[index] = studySource
//                    }
//                }
//
//            }
//
//        )
//    }
}

enum Category: String, CaseIterable, Identifiable {
    case iOSDevelopment = "iOS Development"
    case MachineLearning = "Machine Learning"
    
    var id: String {self.rawValue}
    var name: String {self.rawValue}
}
