//
//  ProductsListAssembly.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import UIKit

final class ProductsListAssembly {
    
    private let serviceAssembly: ServiceAssembly

    init(serviceAssembly: ServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
    func makeProductsListModule (
        moduleOutput: ProductListModuleOutput
    ) -> UIViewController {
        let presenter = ProductsListPresenter(
            moduleOutput: moduleOutput,
            productsService: serviceAssembly.makeProductsService()
        )
        
        let vc = ProductsListViewController(output: presenter)
        presenter.viewInput = vc
        return vc
    }
}
