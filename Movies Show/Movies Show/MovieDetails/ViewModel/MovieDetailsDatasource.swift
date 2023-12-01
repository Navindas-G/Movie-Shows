//
//  MovieDetailsDatasource.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 30/11/23.
//

import Foundation

protocol MovieDetailsDataSourceProtocol {
    func getMovieDetails(for movieId: Int) async throws -> MovieDetailsModel
}

class MovieDetailsDatasource: MovieDetailsDataSourceProtocol {
    func getMovieDetails(for movieId: Int) async throws -> MovieDetailsModel {
        let movieDetailsUrl = Constant.sharedInstance.getMovieDetailURL(for: movieId)
        
        do {
            guard let receivedData = try? await ClientNetworkServices.sharedInstance.getData(for: movieDetailsUrl) else {throw NetworkError.noDataFound}
            print(String(data: receivedData, encoding: .utf8) ?? "")
            guard let model = try? JSONDecoder().decode(MovieDetailsModel.self, from: receivedData) else {throw NetworkError.noDataFound}
            return model
        } catch let caughtError {
            throw caughtError
        }
    }
}
