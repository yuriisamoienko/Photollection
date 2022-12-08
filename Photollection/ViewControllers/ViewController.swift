//
//  ViewController.swift
//  Photollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import UIKit
import ImagesCollection

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.backgroundColor = .yellow
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setViewControllers([ImagesCollectionViewController.loadFromXib(bundle: Bundle(for: ImagesCollectionViewController.self))], animated: false)
    }

}

