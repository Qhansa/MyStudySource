//
//  StudySource.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 26/07/22.
//

//import Foundation
import SwiftUI

class TheStudySource: Identifiable, Equatable, ObservableObject {
    static func == (lhs: TheStudySource, rhs: TheStudySource) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    let id = UUID()
    @Published var topic = ""
    @Published var category = ""
    @Published var urls = [StudySourceURL(text: "")]
    @Published var notes = ""
    
//    var isIOSDevelopment: Bool {
//        
//    }
//    
//    var isMachineLearning: Bool {
//        
//    }
    
    static var example = TheStudySource(
        topic: "Core Data Example",
        category: "iOS Development",
        urls: [StudySourceURL(text: "https://youtu.be/O7u9nYWjvKk"),
               StudySourceURL(text: "https://youtu.be/bvm3ZLmwOdU")],
        notes: "Core Data is Like an SQL for iOS"
    )
    
    init()
    {
        
    }
    
    init(topic: String, category: String, urls: [StudySourceURL], notes: String)
    {
        self.topic = topic
        self.category = category
        self.urls = urls
        self.notes = notes
    }
    
}


