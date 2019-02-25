//
//  InstructionCell.swift
//  TrafficInBelize
//
//  Created by 辛忠翰 on 19/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit
import Lottie
protocol InstructionCellDelegate {
    func scrollToNextCell()
}


class InstructionCell: BasicCell {
    let animationName = "suspects"
    var instructionCellDelegate: InstructionCellDelegate?
    lazy var trafficLightAnimationView: LOTAnimationView = {
        let animationView = LOTAnimationView()
        animationView.setAnimation(named: animationName)
        animationView.contentMode = .scaleAspectFill
        animationView.loopAnimation = true
        animationView.animationSpeed = animationView.animationDuration
        animationView.play(toProgress: 1) { (_) in
        }
        return animationView
    }()
    
    lazy var coverImageView: UIImageView? = {
       let imgView = UIImageView()
        return imgView
    }()
    
    var tapGestureRecognizer: UITapGestureRecognizer?
    
    
    lazy var pinkGreenView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.appleGreen
        return view
    }()
    
    @objc func handleTap(){
        guard let tapGestureRecognizer = tapGestureRecognizer else {return}
        guard let coverImageView = coverImageView else {
            return
        }
        pinkGreenView.removeGestureRecognizer(tapGestureRecognizer)
        coverImageView.rotateAnimation(angle: 0){[weak self] in
            coverImageView.moveAnimation(dx: coverImageView.frame.width, completion: {
                
                self?.coverImageView?.removeFromSuperview()
                self?.instructionCellDelegate?.scrollToNextCell()
                
            })
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.text = "Start"
        label.textAlignment = .center
        return label
    }()
    
    let flagsImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "45degreeFlags.png")
        imgView.contentMode = .scaleAspectFit
        imgView.layer.shadowOffset = CGSize(width: 5, height: 5 )
        imgView.layer.shadowOpacity = 0.7
        imgView.layer.shadowRadius = 5
        imgView.layer.shadowColor = UIColor.rgb(red: 44, green: 62, blue: 80).cgColor
        return imgView
    }()
    
    let taiwanFlagImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "taiwan")
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 3.0
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let belizeFlagImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "belize")
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 3.0
        imgView.clipsToBounds = true
        return imgView
    }()
    
    fileprivate func setupPinkGreenView() {
        addSubview(pinkGreenView)
        pinkGreenView.anchor(top: nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topPadding: 0, bottomPadding: 0, leftPadding: 0, rightPadding: 0, width: 0, height: 200)
        let pinkStackView = UIStackView.init(arrangedSubviews: [taiwanFlagImageView, titleLabel, belizeFlagImageView])
        pinkStackView.spacing = 10.0
        pinkStackView.distribution = .fillEqually
        titleLabel.minimizeAnimation(scaleX: 0.8, scaleY: 0.8)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        pinkGreenView.addGestureRecognizer(tapGestureRecognizer!)
        
        pinkGreenView.addSubview(pinkStackView)
        pinkStackView.anchor(top: pinkGreenView.topAnchor, bottom: pinkGreenView.bottomAnchor, left: pinkGreenView.leftAnchor, right: pinkGreenView.rightAnchor, topPadding: 20, bottomPadding: 20, leftPadding: 20, rightPadding: 20, width: 0, height: 0)
    }
    
    fileprivate func setupFlagsView(){
        addSubview(flagsImageView)
        flagsImageView.translatesAutoresizingMaskIntoConstraints = false
        flagsImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        flagsImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        flagsImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        flagsImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
    }
    
    fileprivate func setupCoverImageViewProperty(_ coverImageView: UIImageView) {
        coverImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       
        coverImageView.anchor(top: topAnchor , bottom: pinkGreenView.topAnchor, left: leftAnchor, right: rightAnchor, topPadding: 30, bottomPadding: -40, leftPadding: 10, rightPadding: -80, width: 0, height: 0)
        coverImageView.contentMode = .scaleAspectFit
        coverImageView.layer.shadowOffset = CGSize(width: 5, height: 5 )
        coverImageView.layer.shadowOpacity = 0.7
        coverImageView.layer.shadowRadius = 5
        coverImageView.layer.shadowColor = UIColor.rgb(red: 44, green: 62, blue: 80).cgColor
        
        let rotationTransform = CGAffineTransform(rotationAngle: -10.0)
        coverImageView.transform = rotationTransform
    }
    
    fileprivate func setupCoverImageView() {
        if coverImageView != nil{
            coverImageView?.removeFromSuperview()
            coverImageView = nil
        }
        coverImageView = UIImageView(image: #imageLiteral(resourceName: "trafficCover"))
        guard let coverImageView = coverImageView else {return}
        addSubview(coverImageView)
        setupCoverImageViewProperty(coverImageView)
        
    }
    
    override func setupViews() {
        setupPinkGreenView()
        setupFlagsView()
        setupCoverImageView()
    }
}
