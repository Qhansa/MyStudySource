//
//  StudySourceViewModel.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 26/07/22.
//

// MARK - 1.1 CORE DATA: LOAD THE CORE DATA
import Foundation
import CoreData

class StudySourceViewModel: ObservableObject {
    // MARK - 1.1a CORE DATA: CREATE A CONSTANT BY USING NSPersistentContainer
    let container = NSPersistentContainer(name: "MyStudySource")
    /// NSPersistentContainer is the actual data being loaded and saved to the device.
    
    // MARK - 1.1b CORE DATA: LOAD THE MYSTUDYSOURCE.XDATAMODEL BY INITIALIZING
    /// At this point we've made our model on MyStudySource.xdatamodel, and we prepared it for using 50y by loading it.
    init() {
        container.loadPersistentStores {description, error in
            /// If any error happened
            if let error = error {
                print("Core Data Failed to load: \(error.localizedDescription)")
            }
        }
    }
}
