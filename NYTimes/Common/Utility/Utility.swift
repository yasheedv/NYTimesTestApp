//
//  Utility.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation
import UIKit
class Utility {
    class func getLocalJsonFile(_ fileName: String, _ bundle: Bundle) -> [String: Any] {
        var json = [String: Any]()
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try? JSONSerialization.jsonObject(with: data ?? Data(), options: .mutableLeaves)
            if let jsonDict = jsonResult as? [String: Any] {
                json = jsonDict
            }
        }
        return json
    }
}
