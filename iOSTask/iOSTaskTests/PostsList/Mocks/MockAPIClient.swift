//
//  MockAPIClient.swift
//  iOSTask
//
//  Created by Adel Aref on 15/11/2024.
//
import Foundation
@testable import iOSTask

class MockAPIClient: APIClientContract {
    var result: Result<[Post], Error>?

    func sendRequest<T: Decodable>(endpoint: Router, responseModel: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        if let result = result as? Result<T, Error> {
            completion(result)
        }
    }
}
