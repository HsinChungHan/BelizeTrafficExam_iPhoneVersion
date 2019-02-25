//
//  LOTAnimationViewExtension.swift
//  LottieAnimationStartedProject
//
//  Created by 辛忠翰 on 13/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit
import Lottie
extension LOTAnimationView{
    func setupProperties(name: String?, contentMode: UIView.ContentMode, isLoop: Bool, isUserInteractionEnabled: Bool){
        if let name = name{
            setAnimation(named: name)
        }
        self.contentMode = contentMode
        self.loopAnimation = isLoop
        self.isUserInteractionEnabled = isUserInteractionEnabled
    }
}
