//
//  ProductDetailAssembly.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import UIKit

final class ProductDetailsAssembly {
    private let serviceAssembly: ServiceAssembly
    
    init(serviceAssembly: ServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
    func makeProductDetailsModule (
        moduleOutput: ProductDetailsModuleOutput,
        id: String
    ) -> UIViewController {
        let presenter = ProductDetailsPresenter(
            moduleOutput: moduleOutput,
            id: id,
            productsService: serviceAssembly.makeProductsService()
            
        )
        
        let vc = ProductDetailsViewController(output: presenter)
        presenter.viewInput = vc
        
        return vc
    }
}
