//
//  UICollectionViewExtension.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 07.12.2022.
//

import UIKit

extension UICollectionView {
    
    // MARK: Functions
    
    func dequeueReusableCell<Type: UICollectionViewCell>(byType cellType: Type.Type, forIndexPath indexPath: IndexPath) throws -> Type {
        let cellTypeString = String(describing: cellType)
        let cell = dequeueReusableCell(withReuseIdentifier: cellTypeString, for: indexPath)
        guard let result = cell as? Type else { // ignore this warning, because AnyClass inherits from UITableView
            throw NSError(message: "cell (\(cell.className()) is not a \(String(describing: type(of: Type.self)))")
        }
        return result
    }
    
}
