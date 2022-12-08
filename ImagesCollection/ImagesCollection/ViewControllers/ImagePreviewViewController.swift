//
//  ImagePreviewViewController.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 08.12.2022.
//

import UIKit

final class ImagePreviewViewController: UIViewController {

    @IBOutlet private weak var imageView: UrlImageView!
    private var imageEndpoint: PicsumPhotoEndpoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // because size of imageView is incorrect before viewDidAppear
        if var endpoint = imageEndpoint {
            endpoint.size = imageView.frame.size // to load image with correct size
            imageView.set(imageUrl: endpoint.url)
            self.imageEndpoint = endpoint
        }
    }
    
    func set(imageEndpoint: PicsumPhotoEndpoint) {
        self.imageEndpoint = imageEndpoint
    }

}
