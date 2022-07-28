//
//  StudySourceEditor.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 28/07/22.
//

import SwiftUI

struct StudySourceEditorView: View {
    @ObservedObject var studySource: TheStudySource
    @State var isNew = false
    
    @State private var isDeleted = false
    @EnvironmentObject var studySourceViewModel: StudySourceViewModel
    @Environment(\.dismiss) private var dismiss
    
//    @State private var studySourceCopy = TheStudySource()
    
    private var isStudySourceDeleted: Bool {
        !studySourceViewModel.exists(studySource) && !isNew
    }
    
    var body: some View {
        VStack {
            StudySourceDetailView(studySource: studySource, isDeleted: $isDeleted, isNew: $isNew)
            
//                .onAppear {
//                    studySourceCopy = studySource
//                }
//                .onChange(of: studySourceCopy) { _ in
//                    if !isDeleted {
//                        studySource = studySourceCopy
//                    }
//                }
            
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        if isNew {
                            Button("Cancel") {
                                dismiss()
                            }
                        }
                    }
                    
                    ToolbarItem {
                        Button {
                            if isNew {
                                studySourceViewModel.studySources
                                    .append(studySource)
                                dismiss()
                            }
                        } label: {
                            Text(isNew ? "Add" : "")
                        }
                        .disabled(studySource.topic.isEmpty)
                    }
                }
        }
        .overlay(alignment: .center) {
            if isStudySourceDeleted {
                Color(UIColor.systemBackground)
                Text("Study Source Deleted. Select an Event.")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

struct StudySourceEditorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StudySourceEditorView(studySource: TheStudySource.example, isNew: true)
                .environmentObject(StudySourceViewModel())
        }
    }
}
