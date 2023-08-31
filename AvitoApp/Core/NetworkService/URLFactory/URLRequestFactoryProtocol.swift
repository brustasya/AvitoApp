//
//  URLRequestFactoryProtocol.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

protocol URLRequestFactoryProtocol {
    func makeURL(for urlString: String) throws -> URL
}
