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
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var urlCopy = buildEnvironment.baseUrl
        if let pathCopy = path {
            urlCopy += pathCopy
        }
        let url = try urlCopy.asURL()
        var urlRequest = URLRequest(url: url)
        // HTTP Method
        urlRequest.httpMethod = httpMethod.rawValue
        // Common Headers
        urlRequest.addValue(acceptType.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.addValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if let params = parameters {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        }
        return urlRequest
    }
}
