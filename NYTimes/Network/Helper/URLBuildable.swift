//
//  URLBuildable.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation
import Alamofire

protocol URLBuildable: URLRequestConvertible {
    // HTTPMethod default is post
    var httpMethod: HTTPMethod {get}
    //API path for the request
    var path: String? {get}
    //Parameters
    var parameters: Parameters? {get}
    //Accept type in header
    var acceptType: ContentType {get}
}

extension URLBuildable {
    var httpMethod: HTTPMethod {
        return .post
    }
    var acceptType: ContentType {
        return .json
    }
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var urlCopy = buildEnvironment.baseUrl
        if let pathCopy = path {
            let removeWhiteSpace = pathCopy.components(separatedBy: .whitespaces).joined()
            urlCopy += removeWhiteSpace
        }
        let url = try urlCopy.asURL()
        var urlRequest = URLRequest(url: url)
        // HTTP Method
        urlRequest.httpMethod = httpMethod.rawValue
        // Common Headers
        urlRequest.addValue(acceptType.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.addValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if let params = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
