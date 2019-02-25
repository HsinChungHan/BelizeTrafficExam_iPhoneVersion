//
//  Example1Cell+WrongAnswerDisappearBlackViewDelegate.swift
//  TrafficInBelize
//
//  Created by 辛忠翰 on 20/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit
extension Example1Cell: WrongAnswerDisappearBlackViewDelegate{
    func removeColockAnimationView() {
        clockAnimationView?.removeFromSuperview()
    }
    
    func disappearBlackView() {
        UIView.animate(withDuration: 1.5, delay: 0.25, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {[weak self] in
            self?.blackView.alpha = 0
            guard let indexPath = self?.walkingIndexPath else {return}
            self?.example1CellDelegate?.scrollToNextIndex(indexPath: indexPath)
        }) {[weak self] (completed) in
            if completed{
                self?.resetPoints()
            }
        }
    }
    
    
}
