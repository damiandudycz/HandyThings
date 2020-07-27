//
//  File.swift
//  
//
//  Created by Home Dudycz on 24/07/2020.
//

import Foundation

public enum StringEncryption {
    
    public static func encrypt(string: String, using key: String) -> Data? {
        guard let data = string.data(using: .utf8) else { return nil }
        return DataEncryption.encrypt(data: data, using: key)
    }
    
    public static func decrypt(data: Data, using key: String) -> String? {
        let decryptedData = DataEncryption.decrypt(data: data, using: key)
        return String(data: decryptedData, encoding: .utf8)
    }
        
    public static func decrypt(file fileName: String, in bundle: Bundle, using key: String) -> String? {
        guard let encryptedData = DataEncryption.decrypt(file: fileName, in: bundle, using: key) else { return nil }
        return decrypt(data: encryptedData, using: key)
    }
    
}

public enum DataEncryption {
    
    static func cipher(for key: String, length: Int) -> [UInt8] {
        let keyChars = key.utf8
        let repeats = Int((Double(length) / Double(keyChars.count)).rounded(.up))
        return Array(((0..<repeats).flatMap { _ in keyChars })[0..<length])
    }
    
    public static func encrypt(data: Data, using key: String) -> Data {
        let cipher = DataEncryption.cipher(for: key, length: data.count)
        let encryptedArray = data.enumerated().map { (index, element) in
            element ^ cipher[index]
        }
        return Data(encryptedArray)
    }
    
    public static func decrypt(data: Data, using key: String) -> Data {
        let cipher = DataEncryption.cipher(for: key, length: data.count)
        let decryptedArray = data.enumerated().map { (index, element) in
            element ^ cipher[index]
        }
        return Data(decryptedArray)
    }

    public static func decrypt(file fileName: String, in bundle: Bundle, using key: String) -> Data? {
        guard let url = bundle.url(forResource: fileName, withExtension: nil), let data = try? Data(contentsOf: url) else {
            return nil
        }
        return decrypt(data: data, using: key)
    }

}
