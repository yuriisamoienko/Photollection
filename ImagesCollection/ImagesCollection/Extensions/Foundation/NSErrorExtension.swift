//
//  NSErrorExtension.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import Foundation

extension NSError {
    
    // MARK: Functions
    
    convenience init(code: Int = 0, message: String) {
        self.init(domain: "", code: code, userInfo: [NSLocalizedDescriptionKey: message])
    }
    
}
