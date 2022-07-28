//
//  StudySourceDetailView.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 28/07/22.
//

import SwiftUI

struct StudySourceDetailView: View {
    @Binding var studySource: TheStudySource
    @Binding var isDeleted: Bool
    @Binding var isNew: Bool
    
    @EnvironmentObject var studySourceViewModel: StudySourceViewModel
    @Environment(\.dismiss) private var dismiss
    
    @FocusState var focusedURL: StudySourceURL?
    
    var body: some View {
        List {
            Section {
                TextField("Topic Name", text: $studySource.topic)
                    .font(.title2)
            }
            
            Section {
                Text("URLs")
                    .fontWeight(.bold)
                
                ForEach($studySource.urls) { $item in
//                    URLRowView
                }
            }
//            Text("THIS IS THE STUDY SOURCE DETAIL VIEW")
        }
    }
}

struct StudySourceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StudySourceDetailView(studySource: .constant(TheStudySource.example), isDeleted: .constant(false), isNew: .constant(false))
    }
}
