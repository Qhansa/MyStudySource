//
//  URLRowView.swift
//  MyStudySource
//
//  Created by Qhansa D. Bayu on 28/07/22.
//

import SwiftUI

struct URLRowView: View {
    @Binding var url: StudySourceURL
    var focusedURL: FocusState<StudySourceURL?>.Binding
    
    var body: some View {
        HStack {
            TextField("https://", text: $url.text)
                .focused(focusedURL, equals: url)
            
            Button {
//                url.text.isEmpty.toggle()
            } label: {
                Image(systemName: url.text.isEmpty ? "link.circle" : "link.circle.fill")
            }
            .buttonStyle(.plain)
            
            Spacer()
        }
    }
}

//struct URLRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        URLRowView()
//    }
//}
