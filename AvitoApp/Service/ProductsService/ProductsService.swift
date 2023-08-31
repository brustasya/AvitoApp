//
//  ProductsService.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

final class ProductsService {
    private let networkService: NetworkServiceProtocol
    private let urlFactory: URLRequestFactoryProtocol
    
    private let mainPageURL: String
    private let detailsURL: String
    private let fileExtension: String
    
    private lazy var imageLoadQueue = OperationQueue()
    
    init(
        networkService: NetworkServiceProtocol,
        urlFactory: URLRequestFactoryProtocol,
        mainPageURL: String,
        detailsURL: String,
        fileExtension: String
    ) {
        self.networkService = networkService
        self.urlFactory = urlFactory
        self.mainPageURL = mainPageURL
        self.detailsURL = detailsURL
        self.fileExtension = fileExtension
        imageLoadQueue.maxConcurrentOperationCount = 1
    }
}

extension ProductsService: ProductsServiceProtocol {
    func getProducts(completion: @escaping (Result<[Advertisement], Error>) -> Void) {
        do {
            let url = try urlFactory.makeURL(
                for: "\(mainPageURL)\(fileExtension)"
            )
            networkService.sendRequest(url: url) { (result: Result<Response<Advertisement>, Error>) in
                switch result {
                case .success(let products):
                    completion(.success(products.advertisements))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    func getProductDetails(for id: String, completion: @escaping (Result<ProductDetailModel, Error>) -> Void) {
        do {
            let url = try urlFactory.makeURL(
                for: "\(detailsURL)\(id)\(fileExtension)"
            )
            networkService.sendRequest(url: url) { (result: Result<ProductDetailModel, Error>) in
                switch result {
                case .success(let product):
                    completion(.success(product))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    func loadImageData(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        networkService.loadImageData(from: urlString, completion: completion)
    }
}
