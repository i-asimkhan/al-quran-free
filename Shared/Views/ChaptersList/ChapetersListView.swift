//
//  ChapetersListView.swift
//  Al Quran
//
//  Created by Asim Khan on 25/09/2021.
//

import SwiftUI

struct ChapetersListView : View {
    
    @ObservedObject var viewModel: QuranChaptersListModelView
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("Quran Chapters")
                            .font(.system(size: 40, weight: .black, design: .rounded))
                        Spacer()
                    }
                    .padding()
                    
                    SearchBarView(text: $searchText)
                        .padding(.top, -20)
                    
                    List(viewModel.chaptersResponse.chapters.filter({ searchText.isEmpty ? true : $0.nameSimple.contains(searchText) }) ) { item in
                        NavigationLink(destination: ChapterDetailsView(viewModel: ChapterdetailsModelView(chapterNumber: item.id))) {
                            Text("\(item.nameSimple) \(item.nameArabic)")
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchBooks()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            //.blueNavigation
        }
       
      
    }
}

struct ChapetersListView_Previews: PreviewProvider {
    static var previews: some View {
        ChapetersListView(viewModel: QuranChaptersListModelView()).preferredColorScheme(.light)
        ChapetersListView(viewModel: QuranChaptersListModelView()).preferredColorScheme(.dark)
    }
}
