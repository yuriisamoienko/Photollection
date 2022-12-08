//
//  CollectionViewController.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import UIKit

private let reuseIdentifier = "PhotoCollectionViewCell"

public final class ImagesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
    
    private let columnLayout = DynamicCollectionViewFlowLayout(
        cellsPerRow: .init(portrait: 3, landscape: 6),
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    
    // MARK: DelegateFlorLayout
    
    
    private func numberOfItemsInSection(_ section: Int) -> Int {
        return Int.max // kind of infinite scroll
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection(section)
    }

    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = try! collectionView.dequeueReusableCell(byType: PhotoCollectionViewCell.self, forIndexPath: indexPath)
        cell.reset() // clear previous values
        
        let cellSize = cell.frame.size
        let urlString = "https://picsum.photos/id/\(indexPath.row)/\(Int(cellSize.width))/\(Int(cellSize.height))"

        if let imageUrl = URL(string: urlString) {
            cell.set(imageUrl: imageUrl)
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}
