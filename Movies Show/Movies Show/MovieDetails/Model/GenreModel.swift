//
//  GenreModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 30/11/23.
//

import Foundation

// MARK: - Genre
struct GenreModel: Codable, Identifiable, Hashable {
    var id: Int?
    var name: String?
    
    enum GenreModelKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: GenreModelKeys.self)
        self.id = try? container?.decodeIfPresent(Int.self, forKey: .id)
        self.name = try? container?.decodeIfPresent(String.self, forKey: .name)
    }
}
