//
//  NetworkConstants.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json        = "application/json"
    case urlEncoded  = "application/x-www-form-urlencoded; charset=utf-8"
    case appleWallet = "application/vnd.apple.pkpass"
    case urlEncodedHttpBody  = "application/x-www-form-urlencoded"
    case textHtml = "text/html"
    case textJavascript = "text/javascript"
}

enum CompletionState {
    case succes(response: Any)
    case failure(error: String)
}

enum NetworkError: Error {
    case emptyResponse
}
