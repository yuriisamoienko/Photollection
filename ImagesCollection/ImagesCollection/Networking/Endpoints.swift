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
    
}

extension EndpointPl {
    
    var absoluteString: String {
        "\(baseUrl)/\(path)"
    }
    
    var url: URL? {
        URL(string: absoluteString)
    }
    
}

