//
//  PicsumPhotoEndpoint.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 08.12.2022.
//

import Foundation

struct PicsumPhotoEndpoint: EndpointPl {
    
    var id: UInt
    var width: UInt
    var height: UInt
    
    var baseUrl: String {
        "https://picsum.photos"
    }
    
    var path: String {
        "id/\(id)/\(width)/\(height)"
    }
    
}

extension PicsumPhotoEndpoint {
    
    var size: CGSize {
        set {
            width = UInt(newValue.width)
            height = UInt(newValue.height)
        }
        get {
            CGSize(
                width: CGFloat(width),
                height: CGFloat(height)
            )
        }
    }
    
    init(id: Int, size: CGSize) {
        self.init(id: UInt(id), width: UInt(size.width), height: UInt(size.height))
    }
    
}
