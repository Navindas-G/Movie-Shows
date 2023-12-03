//
//  MovieListViewModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 28/11/23.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var moviesListArray: [MovieModel] = []
    @Published var shouldShowLoader: Bool = false
    @Published var shouldShowAlert: Bool = false
    @Published var shouldShowNoDataFound: Bool = false
    @Published var alertMessage: String = ""
    
    private let datasource: MovieListDataSource!
    
    init(datasource: MovieListDataSource) {
        self.datasource = datasource
    }
    
    func getMovieList(for urlString: String) {
        shouldShowLoader = true
        Task {
            do {
                let baseModel = try await self.datasource.getMovieListData(for: urlString)
                DispatchQueue.main.async {
                    self.moviesListArray = baseModel.results ?? []
                }
            } catch let caughtError {
                self.shouldShowAlert = true
                DispatchQueue.main.async {
                    self.shouldShowNoDataFound = true
                    
                    if let networkError = caughtError as? NetworkError {
                        self.alertMessage = networkError.rawValue
                    } else {
                        self.alertMessage = caughtError.localizedDescription
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.shouldShowLoader = false
            }
        }
    }
}
