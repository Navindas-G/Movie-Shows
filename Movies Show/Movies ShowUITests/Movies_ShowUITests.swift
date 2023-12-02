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
        app.launch()
        continueAfterFailure = true
        vm = MovieListViewModel(datasource: MovieListDataSource())
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
        app.terminate()
    }
    
    func testRecording() {
        
        let app = XCUIApplication()
        let movielistalertCollectionView = app.collectionViews["movielistalert"]
        movielistalertCollectionView/*@START_MENU_TOKEN@*/.cells.staticTexts["Trolls Band Together"]/*[[".cells.staticTexts[\"Trolls Band Together\"]",".staticTexts[\"Trolls Band Together\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.swipeUp()
        
        let cell = movielistalertCollectionView.children(matching: .cell).element(boundBy: 1)
        cell.images["Photo"].swipeDown()
        
        let moviedetailbackbuttonButton = app/*@START_MENU_TOKEN@*/.buttons["moviedetailbackbutton"]/*[[".buttons[\"Arrow Left Circle\"]",".buttons[\"moviedetailbackbutton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        moviedetailbackbuttonButton.tap()
        
        let image = cell.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image.tap()
        moviedetailbackbuttonButton.tap()
        image.swipeUp()
        image.swipeUp()
        
        let image2 = movielistalertCollectionView.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image2.swipeUp()
        movielistalertCollectionView/*@START_MENU_TOKEN@*/.staticTexts["Five Nights at Freddy's"]/*[[".cells.staticTexts[\"Five Nights at Freddy's\"]",".staticTexts[\"Five Nights at Freddy's\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        moviedetailbackbuttonButton.tap()
        image2.tap()
        moviedetailbackbuttonButton.tap()
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 3).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        moviedetailbackbuttonButton.tap()
        image2.swipeUp()
        image2.tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Name:Mission: Impossible - Dead Reckoning Part One").children(matching: .image).element.tap()
        
        let nameMissionImpossibleDeadReckoningPartOneElement = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Name:Mission: Impossible - Dead Reckoning Part One").element
        nameMissionImpossibleDeadReckoningPartOneElement.tap()
        nameMissionImpossibleDeadReckoningPartOneElement.swipeUp()
        
        let elementsQuery = scrollViewsQuery.otherElements.scrollViews.otherElements
        elementsQuery.staticTexts["Thriller"].tap()
        elementsQuery.staticTexts["Action"].tap()
        nameMissionImpossibleDeadReckoningPartOneElement.swipeUp()
        moviedetailbackbuttonButton.tap()
        image.swipeDown()
        image.swipeDown()
        movielistalertCollectionView/*@START_MENU_TOKEN@*/.staticTexts["Oppenheimer"]/*[[".cells.staticTexts[\"Oppenheimer\"]",".staticTexts[\"Oppenheimer\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
        image2.swipeDown()
        
        let image3 = movielistalertCollectionView.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image3.tap()
        moviedetailbackbuttonButton.tap()
        image3.tap()
        moviedetailbackbuttonButton.tap()
        
    }
    
    func testAgain() {
        
        let app = XCUIApplication()
        let movielistalertCollectionView = app.collectionViews["movielistalert"]
        let image = movielistalertCollectionView.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image.tap()
        
        let moviedetailbackbuttonButton = app/*@START_MENU_TOKEN@*/.buttons["moviedetailbackbutton"]/*[[".buttons[\"Arrow Left Circle\"]",".buttons[\"moviedetailbackbutton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        moviedetailbackbuttonButton.tap()
        
        let cell = movielistalertCollectionView.children(matching: .cell).element(boundBy: 1)
        cell.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        moviedetailbackbuttonButton.tap()
        movielistalertCollectionView/*@START_MENU_TOKEN@*/.staticTexts["Trolls Band Together"]/*[[".cells.staticTexts[\"Trolls Band Together\"]",".staticTexts[\"Trolls Band Together\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        moviedetailbackbuttonButton.tap()
        cell.staticTexts["U/A"].tap()
        moviedetailbackbuttonButton.tap()
        image.tap()
        
        
    }
    
    func testErrorScenario() {
        
        let app = XCUIApplication()
        app.alerts["Error"].scrollViews.otherElements.buttons["OK"].tap()
        
        let nodatafoundStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["nodatafound"]/*[[".staticTexts[\"No Data Found\"]",".staticTexts[\"nodatafound\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nodatafoundStaticText.tap()
        nodatafoundStaticText.tap()
        nodatafoundStaticText.tap()
        
    }
    
    func testTappedView() {
        
        let movielistalertCollectionView = XCUIApplication().collectionViews["movielistalert"]
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        
        let cell = movielistalertCollectionView.children(matching: .cell).element(boundBy: 0)
        let image = cell.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image.tap()
        
        let image2 = movielistalertCollectionView.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image2.tap()
        image2.swipeUp()
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 3).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        movielistalertCollectionView/*@START_MENU_TOKEN@*/.staticTexts["Leo"]/*[[".cells.staticTexts[\"Leo\"]",".staticTexts[\"Leo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        cell.staticTexts["U/A"].tap()
        image.tap()
        image.tap()
    }
    
    func testElementsViews() {
        
        let movielistalertCollectionView = XCUIApplication().collectionViews["movielistalert"]
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        
        let image = movielistalertCollectionView.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image.tap()
        image.swipeUp()
        image.tap()
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 3).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 4).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        
    }
    
    func testAgainElementTapView() {
        
        let movielistalertCollectionView = XCUIApplication().collectionViews["movielistalert"]
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        
        let element = movielistalertCollectionView.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element
        let image = element.children(matching: .other).element.children(matching: .image).element
        image.tap()
        
        let image2 = movielistalertCollectionView.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        image2.tap()
        image2.swipeUp()
        element.tap()
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 3).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 4).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).element.tap()
        image.tap()
        image.tap()
        image.tap()
        image.tap()
        image.tap()
        image.tap()
        image.tap()
        image.tap()
        
        let elementsType = XCUIElement.ElementType.self
        let typeOne = movielistalertCollectionView.children(matching: .cell).element(boundBy: 4).elementType
        print("Element type one : \(typeOne)")
        
        let typeTwo = movielistalertCollectionView.children(matching: .cell).element(boundBy: 4).children(matching: .other).element(boundBy: 1).elementType
        print("Element type two : \(typeTwo)")
        
        let typeThree = movielistalertCollectionView.children(matching: .cell).element(boundBy: 4).children(matching: .other).element(boundBy: 1).children(matching: .other).element
        print("Element type three : \(typeThree)")
        
        let typeFour = movielistalertCollectionView.children(matching: .cell).element(boundBy: 3).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.elementType
        print("Element type four : \(typeFour)")
        
        
    }
    
    func testOnlyImageRecording() {
        
        let movielistalertCollectionView = XCUIApplication().collectionViews["movielistalert"]
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 0).images["Photo"].tap()
        
        let photoImage = movielistalertCollectionView.children(matching: .cell).element(boundBy: 1).images["Photo"]
        photoImage.tap()
        photoImage.swipeUp()
        photoImage.swipeUp()
        
        let photoImage2 = movielistalertCollectionView.children(matching: .cell).element(boundBy: 2).images["Photo"]
        photoImage2.tap()
        photoImage2.tap()
        movielistalertCollectionView.children(matching: .cell).element(boundBy: 3).images["Photo"].tap()
        photoImage2/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        photoImage.swipeUp()
        
    }
}
