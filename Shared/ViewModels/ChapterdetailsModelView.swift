//
//  ChapterdetailsModelView.swift
//  Al Quran
//
//  Created by Asim Khan on 25/09/2021.
//

import Foundation
import Combine

class ChapterdetailsModelView : ObservableObject {
    
    var chapterNumber : Int = 0
    @Published var verses : ChapterVersesResponseModel = ChapterVersesResponseModel(verses: [])
    
    init(chapterNumber : Int) {
        self.chapterNumber = chapterNumber
    }
    
    func fetchBooks()
    {
        let url:URL! = URL(string: "https://api.quran.com/api/v4/quran/verses/uthmani?chapter_number=\(chapterNumber)")
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ChapterVersesResponseModel.self, decoder: JSONDecoder())
            .replaceError(with: ChapterVersesResponseModel(verses: []))
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: &$verses)
        
    }
    
}
