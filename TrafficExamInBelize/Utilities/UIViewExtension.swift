//
//  UIViewControllerExtension.swift
//  LottieAnimationStartedProject
//
//  Created by 辛忠翰 on 13/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit
import QuartzCore
extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?, topPadding: CGFloat, bottomPadding: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat, width: CGFloat, height: CGFloat ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        
        if let left = left{
            leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        
        if let right = right{
            rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }
        
        if width != 0{
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func fullAnchor(superView: UIView) {
        anchor(top: superView.topAnchor, bottom: superView.bottomAnchor, left: superView.leftAnchor, right: superView.rightAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 0)
    }
    
    func centerAnchor(superView: UIView, width: CGFloat, height: CGFloat) {
        anchor(top: nil, bottom: nil, left: nil, right: nil, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: width, height: height)
        centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }
    
    
    func minimizeAnimation(scaleX: CGFloat, scaleY: CGFloat) {
        let minimizeTransform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        transform = minimizeTransform
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.repeat, .autoreverse], animations: { [weak self] in
            self?.transform = CGAffineTransform.identity
        }) { (_) in
        }
    }
    
    func rotateAnimation(angle: CGFloat, completion: @escaping ()->()) {
        let rotateTransform = CGAffineTransform(rotationAngle: angle)
        UIView.animate(withDuration: 1.0, delay: 0 , options: .curveEaseInOut, animations: { [weak self] in
            self?.transform = rotateTransform
        }) { (_) in
            completion()
        }
    }
    
    func moveAnimation(dx: CGFloat?, completion: @escaping ()->()) {
        let moveTransform = CGAffineTransform(translationX: dx!, y: 0)
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {[weak self] in
            self?.transform = moveTransform
        }) { (_) in
            completion()
        }
    }
    
    func addConstraintsWithFormat(format: String, views: UIView...)  {
        var viewsDictionary = [String : UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}
