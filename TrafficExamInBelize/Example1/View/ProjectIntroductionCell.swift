//
//  ProjectIntroductionCell.swift
//  TrafficInBelize
//
//  Created by 辛忠翰 on 26/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit
class ProjectIntroductionCell: BasicCell {
    var instructionCellDelegate: InstructionCellDelegate?
    let imageView: UIImageView = {
       let imv = UIImageView()
        imv.image = #imageLiteral(resourceName: "project")
        imv.contentMode = .scaleAspectFit
        imv.layer.shadowOffset = CGSize(width: 5, height: 5 )
        imv.layer.shadowOpacity = 0.7
        imv.layer.shadowRadius = 5
        imv.layer.shadowColor = UIColor.rgb(red: 44, green: 62, blue: 80).cgColor
        return imv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.text = "Click to next!!"
        label.textAlignment = .center
        return label
    }()
    
    var tapGestureRecognizer: UITapGestureRecognizer?
    lazy var pinkGreenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appleGreen
        return view
    }()
    
    @objc func handleTap(){
        guard let tapGestureRecognizer = tapGestureRecognizer else {return}
        pinkGreenView.removeGestureRecognizer(tapGestureRecognizer)
        self.instructionCellDelegate?.scrollToNextCell()
    }
    
    fileprivate func setupPinkGreenView() {
        addSubview(pinkGreenView)
        pinkGreenView.anchor(top: nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 200)
        pinkGreenView.addSubview(titleLabel)
        titleLabel.centerAnchor(superView: pinkGreenView, width: 300, height: 50)
        titleLabel.minimizeAnimation(scaleX: 0.8, scaleY: 0.8)
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        guard let tapGestureRecognizer = tapGestureRecognizer else {return}
        pinkGreenView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    override func setupViews() {
        setupPinkGreenView()
        addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.anchor(top: topAnchor, bottom: pinkGreenView.topAnchor, left: leftAnchor, right: rightAnchor, topPadding: 10, bottomPadding: 70, leftPadding: 65, rightPadding: 65, width: 0, height: 0)
        setupPinkGreenView()
    }
}
