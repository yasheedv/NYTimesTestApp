//
//  UIColorExtension.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    convenience init(colorCode: String) {
        self.init(hex: colorCode)
    }
    convenience init(hex: String) {
        var string = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if string.hasPrefix("#") {
            string.remove(at: string.startIndex)
        }
        guard string.count == 6 else {
            assertionFailure("Hex string should have 6 characters (besides the #)")
            self.init(colorCode: "#FFFFFF")
            return
        }
        var rgbValue: UInt32 = 0
        Scanner(string: string).scanHexInt32(&rgbValue)
        let red   = (rgbValue >> 16) & 0xff
        let green = (rgbValue >> 8) & 0xff
        let blue  = rgbValue & 0xff
        self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
    }
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red")
        assert(green >= 0 && green <= 255, "Invalid green")
        assert(blue >= 0 && blue <= 255, "Invalid blue")
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    convenience init(oneCode: CGFloat) {
        self.init(red: oneCode, green: oneCode, blue: oneCode)
    }
    convenience init(themeColor: ThemeColor) {
        self.init(hex: themeColor.rawValue)
    }
}
