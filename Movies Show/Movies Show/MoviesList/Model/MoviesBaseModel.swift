//
//  MoviesBaseModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 29/11/23.
//

import Foundation

struct MoviesBaseModel: Decodable {
    var page: Int?
    var results: [MovieModel]?
    var totalPages, totalResults: Int?

    enum MoviesBaseModelKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: MoviesBaseModelKeys.self)
        self.page = try? container?.decodeIfPresent(Int.self, forKey: .page)
        self.results = try? container?.decodeIfPresent([MovieModel].self, forKey: .results)
        self.totalPages = try? container?.decodeIfPresent(Int.self, forKey: .totalPages)
        self.totalResults = try? container?.decodeIfPresent(Int.self, forKey: .totalResults)
    }
}
