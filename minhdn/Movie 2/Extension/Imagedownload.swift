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
}
