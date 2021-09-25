//
//  QuranChaptersListModelView.swift
//  Al Quran
//
//  Created by Asim Khan on 25/09/2021.
//

import Foundation

class QuranChaptersListModelView: ObservableObject {
    let url:URL! = URL(string: "https://api.quran.com/api/v4/chapters?language=en")
    
    @Published var chaptersResponse : QuranChaptersResponseModel = QuranChaptersResponseModel(chapters: [])
    
    
    func fetchBooks()
    {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: QuranChaptersResponseModel.self, decoder: JSONDecoder())
            .replaceError(with: QuranChaptersResponseModel(chapters: []))
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: &$chaptersResponse)
            
            
    }
}
