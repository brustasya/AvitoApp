//
//  ServiceAssembly.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

final class ServiceAssembly {
    private let mainPageURL = "https://www.avito.st/s/interns-ios/main-page"
    private let detailsURL = "https://www.avito.st/s/interns-ios/details/"
    private let fileExtension = ".json"
    
    func makeProductsService() -> ProductsServiceProtocol {
        ProductsService(
            networkService: NetworkService(),
            urlFactory: URLRequestFactory(),
            mainPageURL: mainPageURL,
            detailsURL: detailsURL,
            fileExtension: fileExtension
        )
    }
}
