//
//  StudySourceListView.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 26/07/22.
//

import SwiftUI

struct StudySourceListView: View {
//    @Environment(\.managedObjectContext) var managedObjectContext
    
//    @Binding var studySource: TheStudySource
    @EnvironmentObject var studySourceViewModel: StudySourceViewModel
    @State private var isAddingNewStudySource = false
    @State private var newStudySource = TheStudySource()
    
    var body: some View {
        List {
            Section {

            }
        }
        .navigationTitle("My StudySource")
        .toolbar {
            ToolbarItem {
                Button {
                    newStudySource = TheStudySource()
                    isAddingNewStudySource = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isAddingNewStudySource) {
            NavigationView {
                StudySourceEditorView(studySource: $newStudySource, isNew: true)
            }
        }
        
//        List {
//            Text("iOS Development")
//            Text("Machine Learning")
//            ForEach {
//
//            }
            
//        }
//        .navigationTitle("TEST")
//        .toolbar {
//            ToolbarItem {
//                Button {
//
//                } label: {
//                    Image(systemName: "plus")
//                }
//            }
//        }
    }
}

struct StudySourceListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StudySourceListView().environmentObject(StudySourceViewModel())
        }

    }
}
