//
//  USGradientLayer.swift
//  UIViewStuff
//
//  Created by Vien Van Nguyen on 2/28/17.
//
//

import UIKit

public typealias USGradientPoint = (x: CGPoint, y: CGPoint)

public enum USGradientType {
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    case topRightBottomLeft
    case bottomLeftTopRight
    
    func draw() -> USGradientPoint {
        switch self {
        case .leftRight:
            return (x: CGPoint(x: 0, y: 0.5), y: CGPoint(x: 1, y: 0.5))
        case .rightLeft:
            return (x: CGPoint(x: 1, y: 0.5), y: CGPoint(x: 0, y: 0.5))
        case .topBottom:
            return (x: CGPoint(x: 0.5, y: 0), y: CGPoint(x: 0.5, y: 1))
        case .bottomTop:
            return (x: CGPoint(x: 0.5, y: 1), y: CGPoint(x: 0.5, y: 0))
        case .topLeftBottomRight:
            return (x: CGPoint(x: 0, y: 0), y: CGPoint(x: 1, y: 1))
        case .bottomRightTopLeft:
            return (x: CGPoint(x: 1, y: 1), y: CGPoint(x: 0, y: 0))
        case .topRightBottomLeft:
            return (x: CGPoint(x: 1, y: 0), y: CGPoint(x: 0, y: 1))
        case .bottomLeftTopRight:
            return (x: CGPoint(x: 0, y: 1), y: CGPoint(x: 1, y: 0))
        }
    }
}

public class USGradientLayer : CAGradientLayer {
    public var gradientType: USGradientType? {
        didSet {
            applyPoint()
        }
    }
    
    public convenience init(_ colors: [Any], gradientType: USGradientType? = .leftRight) {
        self.init()
        
        self.colors = colors.map({ (color) -> CGColor in
            if let color = color as? Int {
                return UIColor.init(UInt(color)).cgColor
            }
            
            if let color = color as? UIColor {
                return color.cgColor
            }
            
            return UIColor.clear.cgColor
        })
        
        self.gradientType = gradientType
        applyPoint()
    }
    
    private func applyPoint() {
        if let gradientPoint = gradientType?.draw() {
            startPoint = gradientPoint.x
            endPoint = gradientPoint.y
        }
    }
}

public extension UIView {
    public func addGradientLayer(_ colors: [Any], gradientType: USGradientType? = .leftRight) -> USGradientLayer {
        let gradientLayer = USGradientLayer(colors, gradientType: gradientType)
        gradientLayer.frame = self.layer.bounds
        
        self.layer.addSublayer(gradientLayer)
        return gradientLayer
    }
}
