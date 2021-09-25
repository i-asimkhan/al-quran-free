//
//  QuranChaptersResponseModel.swift
//  Al Quran
//
//  Created by Asim Khan on 25/09/2021.
//

import Foundation

// MARK: - QuranChaptersResponseModel
struct QuranChaptersResponseModel: Codable {
    var chapters: [Chapter]
}

// MARK: - Chapter
struct Chapter: Codable, Identifiable {
    var id: Int
    var revelationPlace: RevelationPlace
    var revelationOrder: Int
    var bismillahPre: Bool
    var nameSimple, nameComplex, nameArabic: String
    var versesCount: Int
    var pages: [Int]
    var translatedName: TranslatedName

    enum CodingKeys: String, CodingKey {
        case id
        case revelationPlace = "revelation_place"
        case revelationOrder = "revelation_order"
        case bismillahPre = "bismillah_pre"
        case nameSimple = "name_simple"
        case nameComplex = "name_complex"
        case nameArabic = "name_arabic"
        case versesCount = "verses_count"
        case pages
        case translatedName = "translated_name"
    }
}

enum RevelationPlace: String, Codable {
    case madinah = "madinah"
    case makkah = "makkah"
}

// MARK: - TranslatedName
struct TranslatedName: Codable {
    var languageName: LanguageName
    var name: String

    enum CodingKeys: String, CodingKey {
        case languageName = "language_name"
        case name
    }
}

enum LanguageName: String, Codable {
    case english = "english"
}
