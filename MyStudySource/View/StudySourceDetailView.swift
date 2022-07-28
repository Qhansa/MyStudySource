//
//  StudySourceDetailView.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 28/07/22.
//

import SwiftUI

struct StudySourceDetailView: View {
    @ObservedObject var studySource: TheStudySource
    @Binding var isDeleted: Bool
    @Binding var isNew: Bool
    
    @EnvironmentObject var studySourceViewModel: StudySourceViewModel
    @Environment(\.dismiss) private var dismiss
    
    @FocusState var focusedURL: StudySourceURL?
    
    var body: some View {
        VStack {
            List {
                Section {
                    TextField("Topic Name", text: $studySource.topic)
                } header: {
                    Text("New Study Source")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color("ColorBlack"))
                        .padding(.bottom, 5)
                }
                
                Section {
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
                            Text("Add URL")
                        }
                    }
                    .buttonStyle(.borderless)
                } header: {
                    Text("URLs")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(Color("ColorDarkChoco"))
                }
                
                Section {
                    TextField("Write something here", text: $studySource.notes)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                } header: {
                    Text("Notes")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(Color("ColorDarkChoco"))
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
}

struct StudySourceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StudySourceDetailView(studySource: TheStudySource.example, isDeleted: .constant(false), isNew: .constant(false))
    }
}
