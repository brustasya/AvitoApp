//
//  ProductsListViewOutput.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

protocol ProductsListViewOutput: AnyObject {
    func productSelected(at index: Int)
    func getProductsCount() -> Int
    func viewIsReady()
    func addProduct(to cell: ProductCell, at index: Int)
}
