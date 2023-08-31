//
//  ProductDetailsPresenter.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

final class ProductDetailsPresenter {
    weak var viewInput: ProductDetailsViewInput?
    weak var moduleOutput: ProductDetailsModuleOutput?
    
    private let productsService: ProductsServiceProtocol
    private let id: String
    
    init(
        moduleOutput: ProductDetailsModuleOutput,
        id: String,
        productsService: ProductsServiceProtocol
    ) {
        self.moduleOutput = moduleOutput
        self.id = id
        self.productsService = productsService
    }
    
    private func closeDetails() {
        moduleOutput?.moduleWantsToCloseProductsDetails()
    }
    
    private func loadProductDetails() {
        productsService.getProductDetails(for: id) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.viewInput?.configure(with: model)
                }
                self?.loadImage(with: model.imageURL)
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.viewInput?.showError()
                }
            }
            
        }
    }
    
    private func loadImage(with url: String) {
        productsService.loadImageData(from: url) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.viewInput?.addImage(with: data)
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
}

extension ProductDetailsPresenter: productDetailsViewOutput {
    func goBack() {
        closeDetails()
    }
    
    func viewIsReady() {
        loadProductDetails()
    }
}
