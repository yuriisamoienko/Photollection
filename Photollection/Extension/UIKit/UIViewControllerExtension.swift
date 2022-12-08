//
//  UIViewControllerExtension.swift
//  Photollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import UIKit

public extension UIViewController {
    
    static func loadFromXib(_ xibName: String, bundle: Bundle = .main) -> Self {
        let result = Self.init(nibName: xibName, bundle: bundle)
        return result
    }
    
    static func loadFromXib(bundle: Bundle) -> Self {
        let xibName = String(describing: Self.self)
        let result = Self.loadFromXib(xibName, bundle: bundle)
        return result
    }
    
}
