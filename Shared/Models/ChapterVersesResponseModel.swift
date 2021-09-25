//
//  ChapterVersesResponseModel.swift
//  Al Quran
//
//  Created by Asim Khan on 25/09/2021.
//

import Foundation

// MARK: - ChapterVersesResponseModel
struct ChapterVersesResponseModel: Codable {
    var verses: [Verse]
    func getAllVerses() -> String  {
        var allVerses = ""
        verses.forEach { (value) in
            allVerses.append(value.textUthmani)
        }
        
        return allVerses
    }
}

// MARK: - Verse
struct Verse: Codable, Identifiable {
    var id: Int
    var verseKey, textUthmani: String

    enum CodingKeys: String, CodingKey {
        case id
        case verseKey = "verse_key"
        case textUthmani = "text_uthmani"
    }
}
