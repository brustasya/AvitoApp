//
//  NetworkServiceProtocol.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func sendRequest<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
    func loadImageData(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void)
}
