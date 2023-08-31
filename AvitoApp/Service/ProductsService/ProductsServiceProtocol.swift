//
//  ProductsServiceProtocol.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

protocol ProductsServiceProtocol {
    func getProducts(completion: @escaping (Result<[Advertisement], Error>) -> Void)
    func getProductDetails(for id: String, completion: @escaping (Result<ProductDetailModel, Error>) -> Void)
    func loadImageData(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void)
}
