//
//  ProductViewModel.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 18/4/2023.
//

import Alamofire
import Foundation

class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    //@Published var isLoading = false
    
    func fetchProducts(completion: @escaping ([Product]?) -> Void) {
            AF.request("http://192.168.159.246:3000/api/product/all").responseDecodable(of: [Product].self) { response in
                switch response.result {
                case .success(let products):
                    completion(products)
                    self.products=products
                    print(products)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }
    }

