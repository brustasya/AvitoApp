//
//  ProductDetailsViewInput.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

protocol ProductDetailsViewInput: AnyObject {
    func configure(with model: ProductDetailModel)
    func addImage(with data: Data)
    func showError()
}
