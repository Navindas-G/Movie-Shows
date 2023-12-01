//
//  MovieDetailTests.swift
//  Movies ShowTests
//
//  Created by Navindas Ghadge on 01/12/23.
//

import XCTest
@testable import Movies_Show
import Combine

final class MovieDetailTests: XCTestCase {
    
    var vm : MovieDetailsViewModel?
    
    var cancellable = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = MovieDetailsViewModel(datasource: MovieDetailsDatasource())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
    }
    
    func testEmptyMovieDetailModel() {
        XCTAssertNil(vm!.movieDetailModel)
    }
    
    func testDataForMovieDetailModel() {
        vm!.fetchMovieDetails(for: 609681)
        
        let movieDetailsExpectation = XCTestExpectation(description: "Movie Detail Expectation")
        var movieDetailModel: MovieDetailsModel!
        vm!.$movieDetailModel.sink { model in
            movieDetailModel = model
            _ = movieDetailModel != nil ? movieDetailsExpectation.fulfill() : Void()
        }
        .store(in: &cancellable)
        
        wait(for: [movieDetailsExpectation], timeout: 20.0)
        XCTAssertNotNil(movieDetailModel.adult)
        XCTAssertNotNil(movieDetailModel.backdropPath)
        XCTAssertNotNil(movieDetailModel.belongsToCollection)
        XCTAssertNotNil(movieDetailModel.budget)
        XCTAssertNotNil(movieDetailModel.genres)
        XCTAssertNotNil(movieDetailModel.homepage)
        XCTAssertNotNil(movieDetailModel.id)
        XCTAssertNotNil(movieDetailModel.imdbID)
        XCTAssertNotNil(movieDetailModel.originalLanguage)
        XCTAssertNotNil(movieDetailModel.overview)
        XCTAssertNotNil(movieDetailModel.originalTitle)
        XCTAssertNotNil(movieDetailModel.popularity)
        XCTAssertNotNil(movieDetailModel.posterPath)
        XCTAssertNotNil(movieDetailModel.productionCompanies)
        XCTAssertNotNil(movieDetailModel.productionCountries)
        XCTAssertNotNil(movieDetailModel.releaseDate)
        XCTAssertNotNil(movieDetailModel.revenue)
        XCTAssertNotNil(movieDetailModel.runtime)
        XCTAssertNotNil(movieDetailModel.spokenLanguages)
        XCTAssertNotNil(movieDetailModel.status)
        XCTAssertNotNil(movieDetailModel.tagline)
        XCTAssertNotNil(movieDetailModel.title)
        XCTAssertNotNil(movieDetailModel.video)
        XCTAssertNotNil(movieDetailModel.voteAverage)
        XCTAssertNotNil(movieDetailModel.voteCount)

        XCTAssertNotNil(movieDetailModel, "Model must contain some data")
    }
    
    func testShowLoaderFlag() {
        XCTAssertFalse(vm!.shouldShowLoader)
        vm!.fetchMovieDetails(for: 609681)
        XCTAssertTrue(vm!.shouldShowLoader)
        
        let loaderFlagExpectation = XCTestExpectation(description: "flag loader")
        var loaderFlag: Bool!
        vm!.$shouldShowLoader.sink { flag in
            loaderFlag = flag
            loaderFlagExpectation.fulfill()
        }
        .store(in: &cancellable)
        
        wait(for: [loaderFlagExpectation], timeout: 15.0)
        XCTAssertEqual(vm!.shouldShowLoader, loaderFlag, "Both flag should be same")
    }
    
    func testShowAlertFlag() {
        XCTAssertFalse(vm!.shouldShowAlert)
        vm!.fetchMovieDetails(for: 0)
        let alertFlagExpectation = XCTestExpectation(description: "alert flag")
        var alertFlag: Bool!
        
        vm!.$shouldShowAlert.sink { flag in
            alertFlag = flag
            alertFlagExpectation.fulfill()
        }
        .store(in: &cancellable)
        XCTAssertEqual(vm!.shouldShowAlert, alertFlag, "Both flag should be same")
    }
    
    func testShowNoDataFoundFlag() {
        XCTAssertFalse(vm!.shouldShowAlert)
        vm!.fetchMovieDetails(for: 0)
        
        let noDataFoundFlagExpectation = XCTestExpectation(description: "flag alert")
        var noDataFoundFlag: Bool!
        vm!.$shouldShowNoDataFound.sink { flag in
            noDataFoundFlag = flag
            noDataFoundFlagExpectation.fulfill()
        }
        .store(in: &cancellable)
        XCTAssertEqual(vm!.shouldShowNoDataFound, noDataFoundFlag, "Both flag should be same")
    }

    func testLoaderVisibilty() {
        XCTAssertFalse(vm!.shouldShowLoader)
    }
    
    func testAlertVisibility() {
        XCTAssertFalse(vm!.shouldShowAlert)
    }

    func testNoDataFoundViewVisibility() {
        XCTAssertFalse(vm!.shouldShowNoDataFound)
    }
    
    func testEmptyMovieDetails() {
        XCTAssertNil(vm!.movieDetailModel)
    }
    
    func testEmptyAlertMessage() {
        XCTAssertTrue(vm!.alertMessage.isEmpty)
    }
}
