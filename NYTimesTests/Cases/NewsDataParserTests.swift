//
//  NewsDataParserTests.swift
//  NYTimesTests
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import XCTest
@testable import NYTimes

class NewsDataParserTests: XCTestCase {
    var localJson = [String: Any]()
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: NewsDataParserTests.self)
        localJson = Utility.getLocalJsonFile("SampleJson", bundle)
    }
    func testParserEmptyValue() {
        let emptyValue = [String: Any]()
        // Passing empty value to parser
        let parse = NewsResultParser.parse(emptyValue)
        switch parse {
        case .succes:
            XCTAssert(false, "Parsing succeeded without any value")
        case .failure:
            break
        }
    }
    func testParserWithDummyData() {
        let parse = NewsResultParser.parse(localJson)
        switch parse {
        case .succes(let response as NewsResultParser):
            XCTAssert(response.result.count == 3, "Result didn't have the expected count")
        case .failure:
            XCTAssert(false, "Parsing failed with data")
        default:
            break
        }
    }
    func testNewsDataHasExpectedValues() {
        let parse = NewsResultParser.parse(localJson)
        switch parse {
        case .succes(let response as NewsResultParser):
            let firstNewsData = response.result[0]
            XCTAssertEqual(firstNewsData.title,
                           "title 1")
            XCTAssertEqual(firstNewsData.publishedDate, "date 1")
        case .failure:
            XCTAssert(false, "Parsing failed with data")
        default:
            break
        }
    }
}
