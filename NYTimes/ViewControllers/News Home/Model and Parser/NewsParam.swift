//
//  NewsParam.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation
import Alamofire

struct NewsParam: URLBuildable {
    var parameters: Parameters? {
        return nil
    }
    var path: String? {
        return nil
    }
    var httpMethod: HTTPMethod {
        return .get
    }
    var acceptType: ContentType {
        return .json
    }
}
