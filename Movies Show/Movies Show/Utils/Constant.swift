//
//  Constant.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 28/11/23.
//

import Foundation


final class Constant {
    private init() {}
    static let sharedInstance = Constant()
    
    let apiToken: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMTVjNzgyN2EzMjc5NTAxOWEwMTgyNWY1MmNjYjMxNSIsInN1YiI6IjY0MGVkNTA4ZTE4ZTNmMDg0MDNhZGI5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0JVM1zM1MznkD9slnWy13FWmOXKOpkrrOwXE1DPg5JA"
    let imageURL: String = "https://image.tmdb.org/t/p/w500/"
    let popularMovieURL: String = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1"
    
    func getMovieDetailURL(for movieId: Int) -> String {
        return "https://api.themoviedb.org/3/movie/\(movieId)?language=en-US"
    }
}


