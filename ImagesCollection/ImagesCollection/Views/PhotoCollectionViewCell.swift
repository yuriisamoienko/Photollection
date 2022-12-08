//
//  PhotoCollectionViewCell.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(image: UIImage) {
        imageView?.image = image
    }

}
