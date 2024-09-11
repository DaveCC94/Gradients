//
//  GroceriesUITests.swift
//  GroceriesUITests
//
//  Created by David Castro Cisneros on 10/09/24.
//

import XCTest

final class GroceriesUITests: XCTestCase {
    func testAccessibilityAudit() throws {
        let app = XCUIApplication()
        app.launchArguments = ["UI-TEST"]
        app.launch()
        
        try app.performAccessibilityAudit()
        
        app.navigationBars["Groceries"]/*@START_MENU_TOKEN@*/.buttons["ADD_NEW_BUTTON"]/*[[".otherElements[\"Add\"]",".buttons[\"Add\"]",".buttons[\"ADD_NEW_BUTTON\"]",".otherElements[\"ADD_NEW_BUTTON\"]"],[[[-1,2],[-1,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.otherElements["Name"].children(matching: .textField).element.tap()
        
        try app.performAccessibilityAudit()
        
        app.otherElements["Name"].children(matching: .textField).element.typeText("Test")
        app.otherElements["Name"].children(matching: .textField).element.typeText("\n")
        
        app.buttons["Add"].tap()

        try app.performAccessibilityAudit()
        
        app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Test"]/*[[".cells.staticTexts[\"Test\"]",".staticTexts[\"Test\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Are you sure you want to remove this item?"].scrollViews.otherElements.buttons["Remove"].tap()
    }
}
