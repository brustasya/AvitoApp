//
//  ProductsListViewInput.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

protocol ProductsListViewInput: AnyObject {
    func loadFinished()
    func showError()
}
