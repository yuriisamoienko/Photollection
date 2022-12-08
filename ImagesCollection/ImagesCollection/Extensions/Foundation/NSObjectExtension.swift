//
//  NSObjectExtension.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import Foundation

extension NSObject {
    
    func className() -> String {
        let result = String(describing: type(of: self))
        return result
    }
    
}
