//
//  ProductListModuleOutput.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

protocol ProductListModuleOutput: AnyObject {
    func moduleWantsToOpenProductDetails(with id: String)
}
