//
//  MovieDetailsModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 30/11/23.
//

import Foundation

// MARK: - MovieDetailsModel
struct MovieDetailsModel: Codable {
    var adult: Bool?
    var backdropPath: String?
    var belongsToCollection: BelongsToCollectionModel?
    var budget: Int?
    var genres: [GenreModel]?
    var homepage: String?
    var id: Int?
    var imdbID, originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [ProductionCompanyModel]?
    var productionCountries: [ProductionCountryModel]?
    var releaseDate: String?
    var revenue, runtime: Int?
    var spokenLanguages: [SpokenLanguageModel]?
    var status, tagline, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum MovieDetailsModelKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: MovieDetailsModelKeys.self)
        self.adult = try? container?.decodeIfPresent(Bool.self, forKey: .adult)
        self.backdropPath = try? container?.decodeIfPresent(String.self, forKey: .backdropPath)
        self.belongsToCollection = try? container?.decodeIfPresent(BelongsToCollectionModel.self, forKey: .belongsToCollection)
        self.budget = try? container?.decodeIfPresent(Int.self, forKey: .budget)
        self.genres = try? container?.decodeIfPresent([GenreModel].self, forKey: .genres)
        self.homepage = try? container?.decodeIfPresent(String.self, forKey: .homepage)
        self.id = try? container?.decodeIfPresent(Int.self, forKey: .id)
        self.imdbID = try? container?.decodeIfPresent(String.self, forKey: .imdbID)
        self.originalLanguage = try? container?.decodeIfPresent(String.self, forKey: .originalLanguage)
        self.originalTitle = try? container?.decodeIfPresent(String.self, forKey: .originalTitle)
        self.overview = try? container?.decodeIfPresent(String.self, forKey: .overview)
        self.popularity = try? container?.decodeIfPresent(Double.self, forKey: .popularity)
        self.posterPath = try? container?.decodeIfPresent(String.self, forKey: .posterPath)
        self.productionCompanies = try? container?.decodeIfPresent([ProductionCompanyModel].self, forKey: .productionCompanies)
        self.productionCountries = try? container?.decodeIfPresent([ProductionCountryModel].self, forKey: .productionCountries)
        self.releaseDate = try? container?.decodeIfPresent(String.self, forKey: .releaseDate)
        self.revenue = try? container?.decodeIfPresent(Int.self, forKey: .revenue)
        self.runtime = try? container?.decodeIfPresent(Int.self, forKey: .runtime)
        self.spokenLanguages = try? container?.decodeIfPresent([SpokenLanguageModel].self, forKey: .spokenLanguages)
        self.status = try? container?.decodeIfPresent(String.self, forKey: .status)
        self.tagline = try? container?.decodeIfPresent(String.self, forKey: .tagline)
        self.title = try? container?.decodeIfPresent(String.self, forKey: .title)
        self.video = try? container?.decodeIfPresent(Bool.self, forKey: .video)
        self.voteAverage = try? container?.decodeIfPresent(Double.self, forKey: .voteAverage)
        self.voteCount = try? container?.decodeIfPresent(Int.self, forKey: .voteCount)
    }
}








