//
//  NSObjectExtension.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import Foundation

extension NSObject {
    
    // MARK: Functions
    
    func className() -> String {
        let result = String(describing: type(of: self))
        return result
    }
    
}
