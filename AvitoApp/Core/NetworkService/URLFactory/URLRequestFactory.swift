//
//  URLRequestFactory.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

final class URLRequestFactory: URLRequestFactoryProtocol {
    func makeURL(for urlString: String) throws -> URL {
        guard let url = URL(string: urlString) else {
            throw (TFSError.makeRequest)
        }
        return url
    }
}
