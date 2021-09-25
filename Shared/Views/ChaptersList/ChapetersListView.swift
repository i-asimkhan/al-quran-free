//
//  ChapetersListView.swift
//  Al Quran
//
//  Created by Asim Khan on 25/09/2021.
//

import SwiftUI

struct ChapetersListView : View {
    
    @ObservedObject var viewModel: QuranChaptersListModelView
    
    var body: some View {
        NavigationView {
            List(viewModel.chaptersResponse.chapters) { item in
                NavigationLink(destination: ChapterDetailsView(viewModel: ChapterdetailsModelView(chapterNumber: item.id))) {
                    Text("\(item.nameSimple) \(item.nameArabic)")
                }
                .navigationTitle("Quran Chapters")
            }
        }
        .onAppear {
            viewModel.fetchBooks()
        }
    }
}


struct ChapetersListView_Previews: PreviewProvider {
    static var previews: some View {
        ChapetersListView(viewModel: QuranChaptersListModelView()).preferredColorScheme(.light)
        ChapetersListView(viewModel: QuranChaptersListModelView()).preferredColorScheme(.dark)
    }
}
