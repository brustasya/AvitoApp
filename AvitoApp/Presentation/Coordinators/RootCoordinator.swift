//
//  RootCoordinator.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import UIKit

final class RootCoordinator {
    private weak var window: UIWindow?
    
    private let productsListAssembly: ProductsListAssembly
    private let productDetailAssembly: ProductDetailsAssembly
    private var productsListNavigationController = UINavigationController()
    
    init(productsListAssembly: ProductsListAssembly, productDetailAssembly: ProductDetailsAssembly) {
        self.productsListAssembly = productsListAssembly
        self.productDetailAssembly = productDetailAssembly
    }
    
    func start(in window: UIWindow) {
        let productsListVC = productsListAssembly.makeProductsListModule(moduleOutput: self)
        productsListNavigationController = UINavigationController(rootViewController: productsListVC)
        
        window.rootViewController = productsListNavigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    private func openProductDetails(with id: String) {
        let productDetailsVC = productDetailAssembly.makeProductDetailsModule(moduleOutput: self, id: id)
        productsListNavigationController.pushViewController(productDetailsVC, animated: true)
    }
    
    private func closeProductDetails() {
        productsListNavigationController.popViewController(animated: true)
    }
}

extension RootCoordinator: ProductListModuleOutput {
    func moduleWantsToOpenProductDetails(with id: String) {
        openProductDetails(with: id)
    }
}

extension RootCoordinator: ProductDetailsModuleOutput {
    func moduleWantsToCloseProductsDetails() {
        closeProductDetails()
    }
}
