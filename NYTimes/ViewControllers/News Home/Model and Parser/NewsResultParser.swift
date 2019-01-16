//
//  NewsModelParser.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation
import Alamofire

class NewsResultParser: NSObject {
    var result = [NewsModel]()
    init(_ json: Parameters ) throws {
        if let results = json["results"] as? [Parameters] {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: results, options: [])
                if let resultModel = try? JSONDecoder().decode([NewsModel].self, from: jsonData) {
                    self.result = resultModel
                }
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        } else {
            throw NetworkError.emptyResponse
        }
    }
}
extension NewsResultParser: Parser {
    static func parse(_ json: Parameters) -> CompletionState {
        do {
            return .succes(response: try NewsResultParser(json))
        } catch {
            return .failure(error: error.localizedDescription)
        }
    }
}
