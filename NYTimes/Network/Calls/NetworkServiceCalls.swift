//
//  NetworkServiceCalls.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation

class NetworkServiceCalls: NetworkAdapter {
    func getNews(_ completion: @escaping CompletionWithSuccessOrFailure) {
        let params = NewsParam()
        fetch(params, NewsResultParser.self) { (state) in
            switch state {
            case .succes(let response):
                completion(.succes(response: response))
            case .failure(let error):
                completion(.failure(error: error))
            }
        }
    }
}
