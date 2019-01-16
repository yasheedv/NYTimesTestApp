//
//  ProjectSettings.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation

let buildEnvironment: BuildEnvironment = .prod
enum BuildEnvironment {
    case sit, uat, prod
    var baseUrl: String {
        switch self {
        case .sit:
            return newsApiUrl
        case .uat:
            return newsApiUrl
        case .prod:
            return newsApiUrl
        }
    }
}
