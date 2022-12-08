//
//  PicsumPhotoEndpoint.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 08.12.2022.
//

import Foundation

struct PicsumPhotoEndpoint: EndpointPl {
    
    enum ImageMode {
        case normal
        case blurred(intense: UInt8) // min 1, max 10
        case grayscaled
    }
    
    var id: UInt
    var width: UInt
    var height: UInt
    var imageMode: ImageMode = .normal
    
    var baseUrl: String {
        "https://picsum.photos"
    }
    
    var path: String {
        "id/\(id)/\(width)/\(height)"
    }
    
    var params: [String: String] {
        var result: [String: String] = [:]
        switch imageMode {
        case .grayscaled:
            result["grayscale"] = ""
        case let .blurred(intense):
            result["blur"] = "\(min(10, max(1, intense)))"
            
        default:
            break
        }
        
        return result
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
