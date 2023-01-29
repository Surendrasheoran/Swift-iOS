//
//  ProductVM.swift
//  ShoppingApp
//
//  Created by Surendra Kumar on 29/01/23.
//

import Foundation

final class ProductVM
{
    var products: [Product] = []
    var eventHandler: ((_ event: Event) -> Void)? // data binding
    
    func fetchProducts() {
        Thread.sleep(forTimeInterval: 3)
        self.eventHandler?(.loading)
        
            Thread.sleep(forTimeInterval: 3)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)

                switch response {
                case .success(let products):
                    self.products = products
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                }
        }
    }
}

extension ProductVM{
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
