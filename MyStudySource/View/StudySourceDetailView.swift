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
                        .foregroundColor(Color("ColorDarkChoco"))
                
                ForEach($studySource.urls) { $item in
                    URLRowView(url: $item, focusedURL: $focusedURL)
                }
                
                .onDelete { indexSet in
                    studySource.urls.remove(atOffsets: indexSet)
                }
                
                Button {
                    let newURL = StudySourceURL(text: "")
                    studySource.urls.append(newURL)
                    focusedURL = newURL
                } label: {
                    HStack {
                        Image(systemName: "plus")
    //                            .foregroundColor(Color("ColorDarkChoco"))
                        Text("Add URL")
    //                            .foregroundColor(Color("ColorDarkChoco"))
                    }
                }
                .buttonStyle(.borderless)
            }
            
            if !isNew {
                Button(role: .destructive) {
                    isDeleted = true
                    dismiss()
                    studySourceViewModel.delete(studySource)
                } label: {
                    Text("Delete Topic")
                        .font(Font.custom("SF Pro", size: 17))
                        .foregroundColor(Color(UIColor.systemRed))
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

struct StudySourceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StudySourceDetailView(studySource: .constant(TheStudySource.example), isDeleted: .constant(false), isNew: .constant(false))
    }
}
