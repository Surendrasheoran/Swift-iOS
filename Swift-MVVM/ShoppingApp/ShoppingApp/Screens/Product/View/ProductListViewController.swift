//
//  ProductListViewController.swift
//  ShoppingApp
//
//  Created by Surendra Kumar on 28/01/23.
//`

import UIKit

class ProductListViewController: UIViewController {

    private let viewModel = ProductVM()
    
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicatorView.startAnimating()
        DispatchQueue.global(qos: .background).async {
            self.configuration()
        }
        // Do any additional setup after loading the view.
    }
}

extension ProductListViewController{
    func configuration(){
        DispatchQueue.main.async {
            self.productTableView?.register(UINib(nibName: "ProductTVC", bundle: nil), forCellReuseIdentifier: "ProductTVC")
        }
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
            
            guard self != nil else {
                return
            }
            
            switch event{
            case .loading:
                print("loading")
                
            case .dataLoaded:
                print("Data Loaded")
                DispatchQueue.main.async {
                    self!.productTableView?.reloadData()
                    self!.activityIndicatorView?.stopAnimating()
                }
              //  print(self.viewModel.products)
              
            case .stopLoading:
                print("stop loading")
                
            case .error(let error):
                print(error!)
            }
            
        }
        }
}

extension ProductListViewController: UITableViewDataSource{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.products.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTVC") as? ProductTVC else
        {
            return UITableViewCell()
        }
        
        let product = viewModel.products[indexPath.row]
        cell.product = product
        
        return cell
    }
    
    
}
