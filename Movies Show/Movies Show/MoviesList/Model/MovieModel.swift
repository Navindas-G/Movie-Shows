//
//  MovieListModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 29/11/23.
//

import Foundation

struct MovieModel: Decodable, Identifiable, Hashable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum ResultKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: ResultKeys.self)
        self.adult = try? container?.decodeIfPresent(Bool.self, forKey: .adult)
        self.backdropPath = try? container?.decodeIfPresent(String.self, forKey: .backdropPath)
        self.genreIDS = try? container?.decodeIfPresent([Int].self, forKey: .genreIDS)
        self.id = try? container?.decodeIfPresent(Int.self, forKey: .id)
        self.originalLanguage = try? container?.decodeIfPresent(String.self, forKey: .originalLanguage)
        self.originalTitle = try? container?.decodeIfPresent(String.self, forKey: .originalTitle)
        self.overview = try? container?.decodeIfPresent(String.self, forKey: .overview)
        self.popularity = try? container?.decodeIfPresent(Double.self, forKey: .popularity)
        self.posterPath = try? container?.decodeIfPresent(String.self, forKey: .posterPath)
        self.releaseDate = try? container?.decodeIfPresent(String.self, forKey: .releaseDate)
        self.title = try? container?.decodeIfPresent(String.self, forKey: .title)
        self.video = try? container?.decodeIfPresent(Bool.self, forKey: .video)
        self.voteAverage = try? container?.decodeIfPresent(Double.self, forKey: .voteAverage)
        self.voteCount = try? container?.decodeIfPresent(Int.self, forKey: .voteCount)
    }
    
    //This constructor is only for preview
//    #if PREVIEW
    init(adult:Bool?,backdropPath:String?,genreIDS:[Int]?,id:Int?,originalLanguage: String?,originalTitle:String?,overview: String?,popularity:Double?,posterPath:String?,releaseDate:String?,title:String?,video:Bool?,voteAverage:Double?,voteCount:Int?) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
//    #endif
}
