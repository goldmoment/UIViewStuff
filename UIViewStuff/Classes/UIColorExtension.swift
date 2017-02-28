//
//  UIColorExtension.swift
//  UIViewStuff
//
//  Created by Vien Van Nguyen on 2/28/17.
//  Copyright © 2017 Vien Van Nguyen. All rights reserved.
//

public extension UIColor {
    convenience init(_ hex: UInt) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
