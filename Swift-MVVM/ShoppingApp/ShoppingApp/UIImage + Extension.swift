//
//  UIImage + Extension.swift
//  ShoppingApp
//
//  Created by Surendra Kumar on 29/01/23.
//

import UIKit
import Kingfisher
extension UIImageView{
    
    func setImage(urlString: String) {
        guard let url = URL(string: urlString) else
        {
            return
        }
        let resource = ImageResource.init(downloadURL: url)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
