//
//  StringExtension.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 08.12.2022.
//

import Foundation

extension String {
    
    // MARK: Functions
    
    func urlEncoded() -> String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
