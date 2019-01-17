//
//  CommonTests.swift
//  NYTimesTests
//
//  Created by Yasheed Muhammed on 1/17/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import XCTest
@testable import NYTimes
class CommonTests: XCTestCase {

    func testColorFromHexExtension() {
        let color = UIColor.init(hex: "#000000")
        XCTAssertEqual(color, UIColor(red: 0, green: 0, blue: 0))
    }
    func testLoadingLocalJson() {
        let bundle = Bundle(for: NewsDataParserTests.self)
        let localJson = Utility.getLocalJsonFile("SampleJson", bundle)
        XCTAssertFalse(localJson.isEmpty, "Local json loading failure")
    }
}
