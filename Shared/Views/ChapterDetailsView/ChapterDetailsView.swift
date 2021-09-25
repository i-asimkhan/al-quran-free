//
//  ChapterDetailsView.swift
//  Al Quran
//
//  Created by Asim Khan on 25/09/2021.
//

import SwiftUI

struct ChapterDetailsView: View {
    @ObservedObject var viewModel: ChapterdetailsModelView
    
    
    var body: some View {
        
//        List(viewModel.verses.verses) { item in
//
//        }
        
        GeometryReader {
            geometry in
            
            ScrollView {
                VStack {
                    Text("\(viewModel.verses.getAllVerses())")
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(nil)
                        
                    
                }
            }
        }
        
       
        .onAppear() {
            viewModel.fetchBooks()
        }
    }
    
}

struct ChapterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterDetailsView(viewModel: ChapterdetailsModelView(chapterNumber: 1))
    }
}
