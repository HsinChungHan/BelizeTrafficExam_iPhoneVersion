//
//  Example1VC+Example1CellDelegate.swift
//  TrafficInBelize
//
//  Created by 辛忠翰 on 20/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import Foundation
extension Example1ViewController: Example1CellDelegate{
    
    func scrollToNextIndex(indexPath: IndexPath) {
        var newIndexItem = indexPath.item
        if indexPath.item < 12{
            newIndexItem = indexPath.item + 1
        }
        let newIndexPath = IndexPath(item: newIndexItem, section: 0)
        collectionView.scrollToItem(at: newIndexPath, at: .init(rawValue: 0), animated: true)
        currentIndexPath = newIndexPath
    }
}
