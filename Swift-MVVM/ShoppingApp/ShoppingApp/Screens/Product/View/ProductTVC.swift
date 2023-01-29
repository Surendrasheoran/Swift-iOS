//
//  ProductTVC.swift
//  ShoppingApp
//
//  Created by Surendra Kumar on 29/01/23.
//

import UIKit

class ProductTVC: UITableViewCell {

    @IBOutlet weak var productCellBG: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productRate: UIButton!
    @IBOutlet weak var productSubTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var product: Product?
    {
        didSet{
            productConfiguration()
        }
    }
    
    @IBOutlet weak var buyButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productCellBG.layer.cornerRadius = 5
        productCellBG.backgroundColor = .systemGray6
        
        
        productImage.layer.cornerRadius = 10
        productImage.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func productConfiguration()  {
        guard product != nil else
        {
            return;
        }
        
        productTitle.text = product?.title
        productPrice.text = "$\(product?.price.description ?? "0")"
        productRate.setTitle("\(product?.rating.rate.description ?? "5")", for: UIControl.State.normal)
        productSubTitle.text = product?.category
        productDescription.text = product?.description
        productImage.setImage(urlString: product!.image)
      
    }
}
