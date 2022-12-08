//
//  CollectionViewController.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import UIKit

private let reuseIdentifier = "PhotoCollectionViewCell"

public final class ImagesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: Overriden Functions
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = columnLayout
        collectionView.contentInsetAdjustmentBehavior = .always

        collectionView.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: .current), forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.max // kind of infinite scroll
    }

    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = try! collectionView.dequeueReusableCell(byType: PhotoCollectionViewCell.self, forIndexPath: indexPath)
        cell.reset() // clear previous values

        if let imageUrl = PicsumPhotoEndpoint(id: indexPath.row, size: cell.frame.size).url {
            cell.set(imageUrl: imageUrl)
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ImagePreviewViewController(nibName: "ImagePreviewViewController", bundle: .current)
        vc.set(imageEndpoint: PicsumPhotoEndpoint(id: indexPath.row, size: .zero))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: Private Properties
    
    private let columnLayout = DynamicCollectionViewFlowLayout(
        cellsPerRow: .init(portrait: 3, landscape: 6),
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
}
