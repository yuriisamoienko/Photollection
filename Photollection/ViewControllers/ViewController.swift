//
//  ViewController.swift
//  Photollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import UIKit
import ImagesCollection

final class ViewController: UIViewController {
    
    // MARK: Overriden Functions

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = ImagesCollectionViewController.loadFromXib(bundle: Bundle(for: ImagesCollectionViewController.self))
        vc.title = "From https://picsum.photos"
        
        navigationController?.setViewControllers([vc], animated: false)
    }

}

