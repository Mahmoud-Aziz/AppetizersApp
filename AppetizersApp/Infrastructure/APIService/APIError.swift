//
//  APIError.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import Foundation

enum APIError: Error {
  case badURLResponse
  case failureStatusCode
  case mappingError
  case corruptedData
  case failedRequest
  case unreachable
  case cancelled
  case badServerResponse
  case corruptedURL
}
