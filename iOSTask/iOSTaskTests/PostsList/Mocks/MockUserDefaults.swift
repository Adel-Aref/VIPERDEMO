//
//  MockUserDefaults.swift
//  iOSTask
//
//  Created by Adel Aref on 15/11/2024.
//

import Foundation
@testable import iOSTask

class MockUserDefaults: UserDefaultsContract {
    
    var dataStore: [String: Any] = [:]

    func data(forKey defaultName: String) -> Data? {
        return dataStore[defaultName] as? Data
    }

    func set(_ value: Any?, forKey defaultName: String) {
        dataStore[defaultName] = value
    }
}
