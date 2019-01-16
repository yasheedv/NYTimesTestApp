//
//  NetworkAdapter.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation
import Alamofire
typealias CompletionWithSuccessOrFailure = (_ state: CompletionState) -> Void

class NetworkAdapter {
    let networkEngine = NetworkEngine()
    /*
     
     Parameters
     
     T :- generic type it should confirm to URLBuildable protocol
     U :- generic type it should confirm to Parser protocol
     parser :- It will be Any type confirmed to Parser protocol, used for parsing the response in seperate class
     buildable : - It will be Any type confirmed to URLBuildable protocol. It will provide HTPP request parametes
     completion : - Call back with success or failure cases
     
     */
    func fetch<T: URLBuildable, U: Parser > (_ buildable: T,
                                             _ parser: U.Type,
                                             _ completion: @escaping CompletionWithSuccessOrFailure) {
        Alamofire.request(buildable)
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    self.networkEngine.fetch(parser, response: value, completion)
                case .failure(let error):
                    completion(.failure(error: error.localizedDescription))
                }
        }
    }
}
