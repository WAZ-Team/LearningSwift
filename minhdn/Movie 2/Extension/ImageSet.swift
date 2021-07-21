//
//  ImageSet.swift
//  Movie 2
//
//  Created by MinhDev on 7/15/21.
//

import Foundation
import UIKit
extension CALayer{
    func giveShadowToTableViewCell(layer:CALayer,Bounds:CGRect , cornerRadius:CFloat) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.8
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: Bounds, cornerRadius: 0.0).cgPath
    }
}
extension UIView{
    var roundedImage: UIView {
        let curvedPercent = 0.15 as CGFloat
        let maskLayer = CAShapeLayer(layer: self.layer)
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x:0, y:0))
        arrowPath.addLine(to: CGPoint(x:self.bounds.size.width, y:0))
        arrowPath.addLine(to: CGPoint(x:self.bounds.size.width, y:self.bounds.size.height - (self.bounds.size.height * curvedPercent)))
        arrowPath.addQuadCurve(to: CGPoint(x:0, y:self.bounds.size.height - (self.bounds.size.height * curvedPercent)), controlPoint: CGPoint(x:self.bounds.size.width/2, y:self.bounds.size.height))
        arrowPath.addLine(to: CGPoint(x:0, y:0))
        arrowPath.close()
        
        maskLayer.path = arrowPath.cgPath
        maskLayer.frame = self.bounds
        maskLayer.masksToBounds = true
        self.layer.mask = maskLayer
        return self
    }
}
enum AssetsColor:String{
    case primaryColor
    case secondaryColor
}

extension UIColor {
    
    /// Returns a given AssetsColor
    static func appColor(_ name: AssetsColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
    
    /// Takes an Hexadecimal String value and converts to UIColor
//    convenience init(hexString: String) {
//        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
//        var int = UInt32()
//        Scanner(string: hex).scanHexInt32(&int)
//        let a, r, g, b: UInt32
//        
//        switch hex.count {
//            case 3: // RGB (12-bit)
//                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
//            case 6: // RGB (24-bit)
//                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
//            case 8: // ARGB (32-bit)
//                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
//            default:
//                (a, r, g, b) = (255, 0, 0, 0)
//        }
//        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
//    }
}
