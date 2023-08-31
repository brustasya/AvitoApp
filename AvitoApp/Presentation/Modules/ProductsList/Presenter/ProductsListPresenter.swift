//
//  ProductsListPresenter.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

final class ProductsListPresenter {
    weak var viewInput: ProductsListViewInput?
    weak var moduleOutput: ProductListModuleOutput?
    
    private let productsService: ProductsServiceProtocol
    
    private lazy var products = [Advertisement]()
    
    init(
        moduleOutput: ProductListModuleOutput,
        productsService: ProductsServiceProtocol
    ) {
        self.moduleOutput = moduleOutput
        self.productsService = productsService
    }
    
    private func loadProducts() {
        productsService.getProducts { [weak self] response in
            switch response {
            case .success(let products):
                self?.products = products
                DispatchQueue.main.async {
                    self?.viewInput?.loadFinished()
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.viewInput?.showError()
                }
            }
        }
    }
    
    private func configureCell(with cell: ProductCell, at index: Int) {
        let id = products[index].id
        cell.configure(with: products[index])
        productsService.loadImageData(from: products[index].imageURL) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    cell.addImage(data: data, id: id)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func openDetails(at index: Int) {
        moduleOutput?.moduleWantsToOpenProductDetails(with: products[index].id)
    }
}

extension ProductsListPresenter: ProductsListViewOutput {
    func productSelected(at index: Int) {
        openDetails(at: index)
    }
    
    func getProductsCount() -> Int {
        return products.count
    }
    
    func viewIsReady() {
        loadProducts()
    }
    
    func addProduct(to cell: ProductCell, at index: Int) {
        configureCell(with: cell, at: index)
    }
}
