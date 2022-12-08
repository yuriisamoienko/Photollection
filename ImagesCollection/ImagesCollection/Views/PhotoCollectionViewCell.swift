//
//  PhotoCollectionViewCell.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: Private Properties
    
    @IBOutlet private weak var imageView: UrlImageView! {
        didSet {
            imageView.updateImageIfNeeded()
        }
    }
    
    // MARK: Overriden Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Functions
    
    func reset() {
        imageView.image = UIImage(systemName: "doc.circle")
    }
    
    func set(imageUrl: URL) {
        imageView.set(imageUrl: imageUrl)
    }
    
   

}
