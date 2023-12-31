//
//  APIService.swift
//  AppetizersApp
//
//  Created by Mahmoud Aziz on 26/08/2023.
//

import Foundation

typealias ResultClosure<T: Decodable> = (Result<T, APIError>) -> Void

protocol APIServiceProtocol {
  func sendRequest<T: Decodable>(decodable: T.Type, request: URLRequest, completion: @escaping ResultClosure<T>)
  func downloadImage(from url: URL, completion: @escaping ResultClosure<Data>)
}

class APIService: APIServiceProtocol {
  private let session: URLSession

  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func sendRequest<T: Decodable>(decodable: T.Type, request: URLRequest, completion: @escaping ResultClosure<T>) {
    let task = session.dataTask(with: request) { data, response, error in
      DispatchQueue.main.async {
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
          completion(.failure(APIError.failedRequest))
          return
        }
        guard statusCode != 401 else {
          completion(.failure(APIError.failureStatusCode))
          return
        }
        guard (200 ..< 300).contains(statusCode) else {
          completion(.failure(APIError.failureStatusCode))
          return
        }
        if error != nil {
          completion(.failure(APIError.failedRequest))
          return
        }
        guard let data else {
          completion(.failure(APIError.corruptedData))
          return
        }
        do {
          let response = try JSONDecoder().decode(decodable.self, from: data)
          DispatchQueue.main.async {
            completion(.success(response))
          }
        } catch {
          completion(.failure(APIError.mappingError))
        }
      }
    }
    task.resume()
  }
  
  func downloadImage(from url: URL, completion: @escaping ResultClosure<Data>) {
    let session = URLSession.shared
    let task = session.dataTask(with: url) { (data, response, error) in
      if error != nil {
        completion(.failure(APIError.failedRequest))
        return
      }
      guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
        completion(.failure(APIError.failedRequest))
        return
      }
      guard statusCode != 401 else {
        completion(.failure(APIError.failureStatusCode))
        return
      }
      guard (200 ..< 300).contains(statusCode) else {
        completion(.failure(APIError.failureStatusCode))
        return
      }
      guard let data = data else {
        completion(.failure(APIError.corruptedData))
        return
      }
      DispatchQueue.main.async {
        completion(.success(data))
      }
    }
    task.resume()
  }
}
