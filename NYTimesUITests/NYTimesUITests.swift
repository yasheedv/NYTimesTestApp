//
//  NYTimesUITests.swift
//  NYTimesUITests
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import XCTest

class NYTimesUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test.
        //Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state
        //- such as interface orientation - required for your
        //tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableLoading() {
        let app = XCUIApplication()
        app.launch()
        sleep(5)
        let cells = app.tables.cells
        if cells.count > 0 {
            let firstCell = cells.element(matching: .cell, identifier: "newsCell0")
            XCTAssert(firstCell.exists, "The cell is not available in table")
            firstCell.tap()
        } else {
            XCTFail("No tableCells found")
        }
    }

}
