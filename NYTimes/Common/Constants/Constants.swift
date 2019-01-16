//
//  Constants.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation
import UIKit

enum TableCellHeight: CGFloat {
    case newsCell = 159
    case newsDetail = 147
}

enum SegueIdentifiers: String {
    case newsDetails = "showDetails"
}

// API URLS
let apiKey = "9xTq3An4b3UkX8Ykxx5tmTxYZCOiIJVV"
let apiPeriods  = 7
let apiSections = "all-sections"
let apiBaseUrl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/"

let newsApiUrl = apiBaseUrl + "/\(apiSections)" + "/\(apiPeriods)" + ".json?api-key=\(apiKey)"
