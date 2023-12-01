//
//  MovieDetailsViewModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 30/11/23.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var movieDetailModel: MovieDetailsModel?
    @Published var shouldShowLoader: Bool = false
    @Published var shouldShowAlert: Bool = false
    @Published var shouldShowNoDataFound = false
    @Published var alertMessage: String = ""
    
    private var datasource: MovieDetailsDatasource!
    
    init(datasource: MovieDetailsDatasource) {
        self.datasource = datasource
    }
    
    func fetchMovieDetails(for movieId: Int) {
        shouldShowLoader.toggle()
        Task {
            do {
                let model = try await self.datasource.getMovieDetails(for: movieId)
                DispatchQueue.main.async {
                    self.movieDetailModel = model
                }
            } catch let caughtError {
                print(caughtError.localizedDescription)
                DispatchQueue.main.async {
                    self.shouldShowNoDataFound.toggle()
                    self.shouldShowAlert.toggle()
                    if let networkError = caughtError as? NetworkError {
                        self.alertMessage = networkError.rawValue
                    } else {
                        self.alertMessage = caughtError.localizedDescription
                    }
                }
            }
            DispatchQueue.main.async {
                self.shouldShowLoader.toggle()
            }
        }
    }
}
