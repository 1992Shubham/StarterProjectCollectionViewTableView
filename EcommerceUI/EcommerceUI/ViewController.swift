//
//  ViewController.swift
//  EcommerceUI
//
//  Created by SHUBHAM AGARWAL on 15/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
        // Do any additional setup after loading the view.
    }
    
    func loadJson() {
        if let path = Bundle.main.path(forResource: "EcommerceJson", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                productData = try jsonDecoder.decode(ProductModel.self, from: jsonData)
                
              } catch {
                   // handle error
              }
        }
    }


}

