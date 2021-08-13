//
//  Imagedownload.swift
//  Movie 2
//
//  Created by MinhDev on 7/13/21.
//

import Foundation
import UIKit


let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
//  MARK:   -   Imagedowload
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: Constants.BACK_DROP_BASE_URL + link) else { return }
        downloaded(from: url, contentMode: mode)
    }
//  MARK:   -   ImageDetail
    
    var roundImage: UIImageView {
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
