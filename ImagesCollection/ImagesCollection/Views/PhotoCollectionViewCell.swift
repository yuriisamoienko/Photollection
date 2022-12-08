//
//  PhotoCollectionViewCell.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            updateImageIfNeeded()
        }
    }
    
    private let fileDownloader: FileDownloaderPl = FileDownloader.shared //TODO inject
    private var imageUrl: URL? {
        didSet {
            updateImageIfNeeded()
        }
    }
    private var needUpdateImage = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reset() {
        imageView?.image = UIImage(systemName: "doc.circle")
        needUpdateImage = true
        imageUrl = nil
    }
    
    func set(imageUrl: URL) {
        self.imageUrl = imageUrl
    }
    
    func updateImageIfNeeded() {
        guard needUpdateImage,
              let url = imageUrl,
              let imageView = self.imageView // is loaded from xib
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
            imageView.image = image
        }
    }

}
