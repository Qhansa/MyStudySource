//
//  StudySource.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 26/07/22.
//

//import Foundation
import SwiftUI

struct TheStudySource: Identifiable, Hashable {
    var id = UUID()
    var topic = ""
    var category = ""
    var urls = [StudySourceURL(text: "")]
    var notes = ""
    
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
    
    
}


