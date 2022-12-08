//
//  Endpoints.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 08.12.2022.
//

import Foundation

protocol EndpointPl {
    
    var baseUrl: String { get }
    var path: String { get }
    var params: [String: String] { get }
    var httpMethod: HttpMethod { get }
    
}

enum HttpMethod {
    case get
    // ...
}

extension EndpointPl {
    
    // MARK: Properties
    
    var absoluteString: String {
        var result = "\(baseUrl)/\(path)"
        switch httpMethod {
        case .get:
            if !params.keys.isEmpty {
                result += "?" + params.map({ (key, value) -> String in
                    var pair = key.urlEncoded()
                    if !value.isEmpty {
                        pair += "=\(value.urlEncoded())"
                    }
                    return pair
                }).joined(separator: "&")
            }
        }
        return result
    }
    
    var url: URL? {
        URL(string: absoluteString)
    }
    
    var httpMethod: HttpMethod {
        .get
    }
    
    var params: [String: String] {
        [:]
    }
    
}

