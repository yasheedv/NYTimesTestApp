//
//  ThemeManager.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation
import UIKit

//Application theme color
enum ThemeColor: String {
    case navigationBar = "#3181b7"
}

class NavigationBarBackground: UINavigationBar {
    override func awakeFromNib() {
        self.backgroundColor = UIColor.init(themeColor: .navigationBar)
        self.barTintColor = UIColor.init(themeColor: .navigationBar)
    }
}
