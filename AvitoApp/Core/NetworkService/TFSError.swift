//
//  TFSError.swift
//  AvitoApp
//
//  Created by Станислава on 30.08.2023.
//

import Foundation

enum TFSError: Error {
    case makeRequest
    case noData
    case redirect
    case badRequest
    case serverError
    case unexpectedStatus
}
