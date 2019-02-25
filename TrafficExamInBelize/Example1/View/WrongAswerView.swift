//
//  WhiteBackgroundView.swift
//  TrafficInBelize
//
//  Created by 辛忠翰 on 18/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

protocol WrongAnswerDisappearBlackViewDelegate {
    func disappearBlackView()
    func removeColockAnimationView()
}

class WrongAswerView: BasicView {
    var isTimeUp: Bool?{
        didSet{
            guard let isTimeUp = isTimeUp else {return}
            if isTimeUp{
                captionLabel.text =  "Time's up 😰"
            }
        }
    }
    var trafficSign: TrafficSignal?{
        didSet{
           trafficSignView.image = trafficSign?.signImage
            guard let rightAnswer = trafficSign?.rightAnswer else {return}
            answerLabel.text = "\(rightAnswer)"
        }
    }
    
    var wrongAnswerDisappearBlackViewDelegate: WrongAnswerDisappearBlackViewDelegate?

    let captionLabel: UILabel = {
       let label = UILabel()
        label.text = "You're Wrong 😭"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor.darkBlueColor
        label.textAlignment = .center
        return label
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.text = "No-Entry"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor.lightRed
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 5.0
        label.clipsToBounds = true
        label.numberOfLines = 0
        return label
    }()
    
    let gotItButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Swipe to continue", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        btn.backgroundColor = UIColor.appleGreen
        btn.layer.cornerRadius = 5.0
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(handleGotItBtn), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleGotItBtn(){
        handlePan()
    }
    
    let trafficSignView: UIImageView = {
       let imv = UIImageView()
        imv.image = #imageLiteral(resourceName: "img0")
        imv.contentMode = .scaleAspectFit
        return imv
    }()
    
    
    fileprivate func setupGestures(){
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    @objc func handlePan(){
        wrongAnswerDisappearBlackViewDelegate?.removeColockAnimationView()
        let rotateTransform = CGAffineTransform(rotationAngle: 180)
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: [
            .curveEaseInOut], animations: { [weak self] in
            self?.transform = rotateTransform
            self?.alpha = 0.0
            self?.wrongAnswerDisappearBlackViewDelegate?.disappearBlackView()
        })
    }
    
    override func setupViews() {
        backgroundColor = .white
        setupGestures()
        setupLayout()
    }
    
    fileprivate func setupLayout(){
        let overallStackView = UIStackView.init(arrangedSubviews: [captionLabel, trafficSignView, answerLabel, gotItButton])
        overallStackView.axis = .vertical
        overallStackView.spacing = 10.0
        captionLabel.heightAnchor.constraint(equalToConstant: frame.height/6).isActive = true
        trafficSignView.heightAnchor.constraint(equalToConstant: frame.height/2).isActive = true
        answerLabel.heightAnchor.constraint(equalToConstant: frame.height/6).isActive = true
        answerLabel.minimizeAnimation(scaleX: 0.8, scaleY: 0.8)
        gotItButton.heightAnchor.constraint(equalToConstant: frame.height/6).isActive = true
        print(frame.height)
        addSubview(overallStackView)
        overallStackView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topPadding: 10, bottomPadding: 10, leftPadding: 10, rightPadding: 10, width: 0, height: 0)
        
    }
}

