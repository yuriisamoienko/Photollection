//
//  PhotoInfoEndpoint.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 08.12.2022.
//

import Foundation

struct PhotoInfoEndpoint: EndpointPl {
    
    var id: UInt
    
    var baseUrl: String {
        "https://picsum.photos"
    }
    
    var path: String {
        "id/\(id)/info"
    }
    
}

extension PhotoInfoEndpoint {
    
    struct Info: Codable {
        let id: String
        let author: String
        let width: Int
        let height: Int
        let url: String
        let download_url: String
        
        enum CodingKeys : String, CodingKey {
            case id, author, width, height, url, download_url
        }
        
        var description: String {
            """
            id: \(id)
            author: \(author)
            width: \(width)
            height: \(height)
            """
        }
    }
    
    func getInfo() async throws -> Info {
        guard let url = self.url else {
            throw NSError(message: "failed create url from: \(absoluteString)")
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(Info.self, from: data)
    }
}


