//
//  UIViewExtension.swift
//  Pods
//
//  Created by Vien Van Nguyen on 3/3/17.
//
//

import UIKit

public extension UIView {
    // Change anchor point without change center position
    public func setAnchorPoint(_ point: CGPoint) {
        
        guard layer.anchorPoint != point else { return }
        
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y)
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var c = layer.position
        c.x = c.x + newPoint.x - oldPoint.x
        c.y = c.y + newPoint.y - oldPoint.y
        
        layer.position = c
        layer.anchorPoint = point
    }
}
