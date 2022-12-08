//
//  UIInterfaceOrientationValues.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 08.12.2022.
//

import UIKit

struct UIInterfaceOrientationValues {
    
    let portrait: Int
    let landscape: Int
    
    func value(for orientation: UIInterfaceOrientation) -> Int {
        let result = orientation == .portrait ? portrait : landscape
        return result
    }
    
}
