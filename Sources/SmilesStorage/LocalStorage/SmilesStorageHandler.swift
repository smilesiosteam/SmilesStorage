//
//  File.swift
//  
//
//  Created by Abdul Rehman Amjad on 02/01/2024.
//

import Foundation
import UIKit

public enum SmilesStorageType {
    case keychain
    case userDefaults
}

public final class SmilesStorageHandler {
    
    private let storage: SmilesObjectSavable
    
    public init(storageType: SmilesStorageType) {
        switch storageType {
        case .keychain:
            self.storage = SmilesKeychain()
        case .userDefaults:
            self.storage = UserDefaults.standard
        }
    }
    
    public func getValue<T: Decodable>(forKey key: SmilesStorageKeys) -> T? {
        return try? storage.getObject(forKey: key.rawValue, castTo: T.self)
    }
    
    public func setValue<T: Encodable>(_ value: T, forKey: SmilesStorageKeys) {
        try? storage.setObject(value, forKey: forKey.rawValue)
    }
    
    public func remove(_ forKey: SmilesStorageKeys) {
        let nilValue: String? = nil
        try? storage.setObject(nilValue, forKey: forKey.rawValue)
    }
    
}
