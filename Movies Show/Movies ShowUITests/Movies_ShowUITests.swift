//
//  Movies_ShowUITests.swift
//  Movies ShowUITests
//
//  Created by Navindas Ghadge on 28/11/23.
//

import XCTest
@testable import Movies_Show
import Combine

final class Movies_ShowUITests: XCTestCase {

    var vm : MovieListViewModel!
    var cancellable = Set<AnyCancellable>()
    let app = XCUIApplication()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        vm = MovieListViewModel(datasource: MovieListDataSource())
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
        app.terminate()
    }
    
    func testAppLaunch() {
        app.launch()
        
        
        
        XCTAssertFalse(vm.shouldShowLoader)
        vm.getMovieList(for: Constant.sharedInstance.popularMovieURL)
        XCTAssertTrue(vm.shouldShowLoader)
        Thread.sleep(forTimeInterval: 5.0)
        
        let list = app.tables["movielist"]
        
        let alert = app.alerts["Error"]
        let okButton = alert.buttons["OK"]
        let noDataText = app.staticTexts["nodatafound"]
        
        var alertFlag: Bool!
        
        let showAlertExpectation = XCTestExpectation(description: "show alert")
        
        vm.$shouldShowAlert.sink { flag in
            alertFlag = flag
            _ = alertFlag ? showAlertExpectation.fulfill() : Void()
        }
        .store(in: &cancellable)
        
        wait(for: [showAlertExpectation], timeout: 20.0)
        
        if vm.shouldShowAlert {
            XCTAssertEqual(vm.moviesListArray.count, 0)
            XCTAssertTrue(vm.shouldShowAlert)
            
            
            XCTAssertTrue(alert.exists)
            XCTAssertTrue(alert.elementType == .alert)
            
            
            XCTAssertTrue(okButton.exists)
            XCTAssertTrue(okButton.elementType == .button)
            okButton.tap()
            
            XCTAssertFalse(alert.exists)
            XCTAssertFalse(okButton.exists)
            
            
            XCTAssertTrue(noDataText.exists)
            XCTAssertTrue(noDataText.elementType == .staticText)
            
            
            
        } else {
            for i in 0..<vm.moviesListArray.count {
                let link = list.otherElements["NavigationLink" + String(vm.moviesListArray[i].id ?? 0)]
                link.tap()
                Thread.sleep(forTimeInterval: 10.0)
                
                let backBtn = app.otherElements["moviedetailbackbutton"]
                backBtn.tap()
            }
            
            XCTAssertGreaterThan(vm.moviesListArray.count, 0)
            XCTAssertTrue(!vm.moviesListArray.isEmpty)
            XCTAssertFalse(vm.shouldShowAlert)
            XCTAssertFalse(vm.shouldShowLoader)
            XCTAssertFalse(vm.shouldShowNoDataFound)
        }
    }
    
    
}
