//
//  Movies_ShowTests.swift
//  Movies ShowTests
//
//  Created by Navindas Ghadge on 28/11/23.
//

import XCTest
@testable import Movies_Show
import Combine

final class Movies_ShowTests: XCTestCase {
    
    var vm : MovieListViewModel?
    
    var cancellable = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = MovieListViewModel(datasource: MovieListDataSource())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
    }
    
    func test_for_MovieList() {
        guard let vm = vm else {return}
        var movieList = [MovieModel]()
        vm.getMovieList(for: Constant.sharedInstance.popularMovieURL)
        
        let fetchedDataExpectation = XCTestExpectation(description: "fetch data")
        
        vm.$moviesListArray.sink { _ in } receiveValue: { list in
            movieList = list
            _ = movieList.count > 0 ? fetchedDataExpectation.fulfill() : Void()
        }
        .store(in: &cancellable)

        wait(for: [fetchedDataExpectation], timeout: 30.0)
        XCTAssertGreaterThan(vm.moviesListArray.count, 0)
        XCTAssertGreaterThan(movieList.count, 0)
        XCTAssertEqual(vm.moviesListArray.count, movieList.count, "Both list count must be equal")
    }
    
    func test_For_InvalidUrl() {
        var message: String = ""
        vm!.getMovieList(for: "")
        
        let throwErrorExpectation = XCTestExpectation(description: "throw error")
        
        vm!.$alertMessage.sink { value in
            message = value
            throwErrorExpectation.fulfill()
        }
        .store(in: &cancellable)
        
        wait(for: [throwErrorExpectation], timeout: 15.0)
        XCTAssertEqual(vm!.alertMessage, message, "Both message should be same")
    }
    
    func testShowLoaderFlag() {
        XCTAssertFalse(vm!.shouldShowLoader)
        vm!.getMovieList(for: Constant.sharedInstance.popularMovieURL)
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
        vm!.getMovieList(for: "")
        
        let alertFlagExpectation = XCTestExpectation(description: "flag alert")
        var alertFlag: Bool!
        vm!.$shouldShowAlert.sink { flag in
            alertFlag = flag
            _ = alertFlag ? alertFlagExpectation.fulfill() : Void()
        }
        .store(in: &cancellable)
        XCTAssertTrue(vm!.shouldShowAlert)
        XCTAssertTrue(alertFlag)
        XCTAssertEqual(vm!.shouldShowAlert, alertFlag, "Both flag should be same")
    }
    
    func testShowNoDataFoundFlag() {
        XCTAssertFalse(vm!.shouldShowAlert)
        vm!.getMovieList(for: "")
        
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
    
    func testEmptyList() {
        XCTAssertTrue(vm!.moviesListArray.isEmpty)
        XCTAssertEqual(vm!.moviesListArray.count, 0)
    }
    
    func testEmptyAlertMessage() {
        XCTAssertTrue(vm!.alertMessage.isEmpty)
    }
    
    
}
