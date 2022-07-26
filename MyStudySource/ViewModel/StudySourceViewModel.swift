//
//  StudySourceViewModel.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 26/07/22.
//

import Foundation
import CoreData

class StudySourceViewModel: ObservableObject {
    let container = NSPersistentContainer(name: "StudySource")
    
    init() {
        container.loadPersistentStores {description, error in
            if let error = error {
                print("Core Data Failed to load: \(error.localizedDescription)")
            }
            
        }
    }
    
}
