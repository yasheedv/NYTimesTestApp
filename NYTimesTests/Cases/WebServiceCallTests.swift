//
//  WebServiceCallTests.swift
//  NYTimesTests
//
//  Created by Yasheed Muhammed on 1/16/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import XCTest
@testable import NYTimes
class WebServiceCallTests: XCTestCase {

    func testNyTimesArticleApicall() {
        let expectation = self.expectation(description: "Wait for news api call")
        let network = NetworkServiceCalls()
        network.getNews { (state) in
            switch state {
            case .succes(let response as NewsResultParser):
                if response.result.isEmpty {
                    XCTFail("Empty value recieved")
                }
            case .failure:
                XCTFail("WebService call failed")
            default:
                break
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}
