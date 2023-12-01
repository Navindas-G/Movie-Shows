//
//  SpokenLanguageModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 30/11/23.
//

import Foundation

// MARK: - SpokenLanguage
struct SpokenLanguageModel: Codable {
    var englishName, iso639_1, name: String?

    enum SpokenLanguageModelKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: SpokenLanguageModelKeys.self)
        self.englishName = try? container?.decodeIfPresent(String.self, forKey: .englishName)
        self.iso639_1 = try? container?.decodeIfPresent(String.self, forKey: .iso639_1)
        self.name = try? container?.decodeIfPresent(String.self, forKey: .name)
    }
}
