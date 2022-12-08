//
//  BundleExtension.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import Foundation

extension Bundle {
    
    // MARK: Properties
    
    static var current: Bundle {
        Bundle(for: ThisBundleClass.self)
    }
    
}

fileprivate class ThisBundleClass {}
