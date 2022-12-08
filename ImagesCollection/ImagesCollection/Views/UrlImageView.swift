//
//  UrlImageView.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 08.12.2022.
//

import UIKit

final class UrlImageView: UIImageView {
    
    // MARK: Private Properties

    private let fileDownloader: FileDownloaderPl = FileDownloader.shared //TODO inject
    private var imageUrl: URL? {
        didSet {
            updateImageIfNeeded()
        }
    }
    private var needUpdateImage = true
    
    // MARK: Functions
    
    func set(imageUrl: URL?) {
        needUpdateImage = true
        self.imageUrl = imageUrl
    }
    
    func updateImageIfNeeded() {
        guard needUpdateImage,
              let url = imageUrl
        else {
            return
        }
        needUpdateImage = false
        
        Task {
            guard let data = try? await fileDownloader.load(from: url),
                  let image = UIImage(data: data)
            else {
                needUpdateImage = true
                return
            }
            self.image = image
        }
    }
    
}
