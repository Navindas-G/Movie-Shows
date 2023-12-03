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
    
    let app = XCUIApplication()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        app.launch()
        continueAfterFailure = false
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
    }
    
    func testMovieListResponsiveness() {
        let movielistCollectionView = app.collectionViews["movielist"]
        let image = movielistCollectionView.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        Thread.sleep(forTimeInterval: 3.0)
        image/*@START_MENU_TOKEN@*/.swipeUp()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        image.swipeDown()
        
        let image2 = movielistCollectionView.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image2.tap()
        Thread.sleep(forTimeInterval: 3.0)
        let scrollViewsQuery = app.scrollViews.otherElements.children(matching: .image).element
        scrollViewsQuery.swipeUp(velocity: XCUIGestureVelocity(rawValue: 2000.0))
        scrollViewsQuery.swipeDown(velocity: XCUIGestureVelocity(rawValue: 2000.0))
        
        let moviedetailbackbuttonButton = app/*@START_MENU_TOKEN@*/.buttons["moviedetailbackbutton"]/*[[".buttons[\"Arrow Left Circle\"]",".buttons[\"moviedetailbackbutton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 3.0)
        image.swipeDown()
        image2.tap()
        Thread.sleep(forTimeInterval: 3.0)
        
        scrollViewsQuery.swipeUp()
        scrollViewsQuery.swipeUp()
        
        
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 3.0)
        let image4 = movielistCollectionView.children(matching: .cell).element(boundBy: 3).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image4.swipeDown()
        
        scrollViewsQuery.swipeUp()
        
        scrollViewsQuery.swipeDown()
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 3.0)
        movielistCollectionView.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        image4.tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        image2.tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        image2.tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        image.tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        image2.swipeUp()
        image.tap()
        Thread.sleep(forTimeInterval: 2.0)
        scrollViewsQuery.swipeUp()
        scrollViewsQuery.swipeDown()
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        image2.tap()
        Thread.sleep(forTimeInterval: 2.0)
        scrollViewsQuery.swipeUp()
        scrollViewsQuery.swipeDown()
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        image4.tap()
        Thread.sleep(forTimeInterval: 2.0)
        scrollViewsQuery.swipeUp()
        moviedetailbackbuttonButton.tap()
    }
    
    func testMovieDetailPageResponsiveness() {
        let movielistalertCollectionView = app.collectionViews["movielist"]
        let image = movielistalertCollectionView.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        Thread.sleep(forTimeInterval: 3.0)
        image.tap()
        Thread.sleep(forTimeInterval: 2.0)
        let moviedetailbackbuttonButton = app/*@START_MENU_TOKEN@*/.buttons["moviedetailbackbutton"]/*[[".buttons[\"Arrow Left Circle\"]",".buttons[\"moviedetailbackbutton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        let cell = movielistalertCollectionView.children(matching: .cell).element(boundBy: 1)
        cell.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        cell.staticTexts["U/A"].tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        image.tap()
    }
    
    func testTappedView() {
        let movielistalertCollectionView = app.collectionViews["movielist"]
        Thread.sleep(forTimeInterval: 2.0)
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        Thread.sleep(forTimeInterval: 2.0)
        let moviedetailbackbuttonButton = app/*@START_MENU_TOKEN@*/.buttons["moviedetailbackbutton"]/*[[".buttons[\"Arrow Left Circle\"]",".buttons[\"moviedetailbackbutton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        let cell = movielistalertCollectionView.children(matching: .cell).element(boundBy: 0)
        let image = cell.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image.tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        let image2 = movielistalertCollectionView.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image2.tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        image2.swipeUp()
        
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 3).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        image.tap()
        Thread.sleep(forTimeInterval: 2.0)
        moviedetailbackbuttonButton.tap()
        Thread.sleep(forTimeInterval: 2.0)
        image.tap()
    }
}
