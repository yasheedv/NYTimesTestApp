//
//  Parser.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation
import Alamofire

/*
 protocol Parser is used to send the json value to the Classes for parsing the json
 */

public protocol Parser {
    static func parse(_ json: Parameters) -> CompletionState
}
