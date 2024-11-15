//
//  APIClient.swift
//  FakeStoreDemo
//
//  Created by Adel Aref on 27/02/2024.
//

import Foundation

protocol APIClientContract {
    func sendRequest<T: Decodable>(endpoint: Router, responseModel: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

class APIClient: APIClientContract {
    func sendRequest<T: Decodable>(endpoint: Router, responseModel: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: endpoint.url) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method

        if let parameters = endpoint.parameters {
            var components = URLComponents(string: endpoint.url)
            components?.queryItems = parameters
            urlRequest.url = components?.url
        }

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
