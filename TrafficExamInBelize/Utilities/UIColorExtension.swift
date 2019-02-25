//
//  UIColorExtension.swift
//  LottieAnimationStartedProject
//
//  Created by 辛忠翰 on 13/04/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    static let blackColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    static let lightBlackColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let lightRed = UIColor.rgb(red: 247, green: 66, blue: 82)
    static let tealColor = UIColor.rgb(red: 48, green: 164, blue: 184)
    static let darkBlueColor = UIColor.rgb(red: 9, green: 45, blue: 64)
    static let lightBlue = UIColor.rgb(red: 218, green: 235, blue: 243)
    static let skyBlue = UIColor.rgb(red: 123, green: 212, blue: 249)
    static let lightOrange = UIColor.rgb(red: 255, green: 90, blue: 95)
    static let appleGreen = UIColor.rgb(red: 1, green: 209, blue: 193)

}
