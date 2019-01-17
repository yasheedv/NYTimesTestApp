//
//  NetworkEngine.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation
import Alamofire
final class NetworkEngine {
    /*
     Parameters
     T :- generic type
     parser : - Parser class
     response : - Response recieved from request
     completion: Call back
     
     */
    func fetch<T: Parser>(_ parser: T.Type, response: Any, _ completion: CompletionWithSuccessOrFailure) {
        if let parameters = response as? Parameters {
            self.parse(parser, parametes: parameters, completion)
        } else {
            completion(.failure(error: "Invalid response format"))
        }
    }
    /*
     Parameters
     T :- generic type
     parser : - Parser class
     parametes : - response in [String:Any] format
     */
    fileprivate func parse<T: Parser>(_ parser: T.Type,
                                      parametes: Parameters,
                                      _ completion: CompletionWithSuccessOrFailure) {
        let parsingStauts = T.parse(parametes)
        switch parsingStauts {
        case .succes(let value):
            completion(.succes(response: value))
        case .failure(let error):
            completion(.failure(error: error))
        }
    }
}
