//
//  PhotoCollectionViewCell.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UrlImageView! {
        didSet {
            imageView.updateImageIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reset() {
        imageView.reset()
    }
    
    func set(imageUrl: URL) {
        imageView.set(imageUrl: imageUrl)
    }
    
   

}
