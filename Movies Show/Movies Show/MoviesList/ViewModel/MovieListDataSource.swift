//
//  MovieListDataSource.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 28/11/23.
//

import Foundation

protocol MovieListDataSourceProtocol {
    func getMovieListData(for urlString: String) async throws -> MoviesBaseModel
}

class MovieListDataSource: MovieListDataSourceProtocol {
    func getMovieListData(for urlString: String) async throws -> MoviesBaseModel {
        do {
            let data = try await ClientNetworkServices.sharedInstance.getData(for: urlString)
            print(String(data: data ?? Data(), encoding: .utf8) ?? "")
            let model = try JSONDecoder().decode(MoviesBaseModel.self, from: data ?? Data())
            return model
        } catch let caughtError {
            print(caughtError.localizedDescription)
            throw caughtError
        }
    }
}
