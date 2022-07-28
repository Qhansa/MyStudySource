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
                ForEach(studySourceViewModel.studySources) {
                    studySource in
                    NavigationLink {
                        StudySourceEditorView(studySource: studySource, isNew: false)
                    } label: {
                        VStack {
                            Text("\(studySource.topic)")
                        }
                    }
                }
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
                StudySourceEditorView(studySource: newStudySource, isNew: true)
            }
        }
    }
}

struct StudySourceListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StudySourceListView().environmentObject(StudySourceViewModel())
        }

    }
}
