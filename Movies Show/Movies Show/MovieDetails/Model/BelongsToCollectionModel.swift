//
//  BelongsToCollectionModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 30/11/23.
//

import Foundation

// MARK: - BelongsToCollection
struct BelongsToCollectionModel: Codable {
    var id: Int?
    var name, posterPath, backdropPath: String?

    enum BelongsToCollectionModelKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: BelongsToCollectionModelKeys.self)
        self.id = try container?.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container?.decodeIfPresent(String.self, forKey: .name)
        self.posterPath = try container?.decodeIfPresent(String.self, forKey: .posterPath)
        self.backdropPath = try container?.decodeIfPresent(String.self, forKey: .backdropPath)
    }
}
