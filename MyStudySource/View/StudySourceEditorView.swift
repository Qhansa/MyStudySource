//
//  StudySourceEditor.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 28/07/22.
//

import SwiftUI

struct StudySourceEditorView: View {
    @Binding var studySource: TheStudySource
    @State var isNew = false
    
    @State private var isDeleted = false
    @EnvironmentObject var studySourceViewModel: StudySourceViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var studySourceCopy = TheStudySource()
    
    private var isStudySourceDeleted: Bool {
        !studySourceViewModel.exists(studySourceCopy) && !isNew
    }
    
    var body: some View {
        VStack {
            StudySourceDetailView(studySource: $studySourceCopy, isDeleted: $isDeleted, isNew: $isNew)
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
                                    .append(studySourceCopy)
                                dismiss()
                            }
                        } label: {
                            Text(isNew ? "Add" : "")
                        }
                        .disabled(studySourceCopy.topic.isEmpty)
                    }
                }
                .onAppear {
                    studySourceCopy = studySource
                }
                .onChange(of: studySourceCopy) { _ in
                    if !isDeleted {
                        studySource = studySourceCopy
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
            StudySourceEditorView(studySource: .constant(TheStudySource()), isNew: true)
                .environmentObject(StudySourceViewModel())
        }
    }
}
