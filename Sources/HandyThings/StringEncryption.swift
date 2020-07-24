//
//  File.swift
//  
//
//  Created by Home Dudycz on 24/07/2020.
//

import Foundation

public enum StringEncryption {
    
    private static func cipher(for key: String, length: Int) -> [UInt8] {
        let keyChars = key.utf8
        let repeats = Int((Double(length) / Double(keyChars.count)).rounded(.up))
        return Array(((0..<repeats).flatMap { _ in keyChars })[0..<length])
    }
    
    public static func encrypt(string: String, using key: String) -> Data {
        let stringUTF8 = string.utf8
        let cipher = self.cipher(for: key, length: stringUTF8.count)
        let encryptedArray = stringUTF8.enumerated().map { (index, element) in
            element ^ cipher[index]
        }
        return Data(encryptedArray)
    }
    
    public static func decrypt(data: Data, using key: String) -> String? {
        let cipher = self.cipher(for: key, length: data.count)
        let decryptedArray = data.enumerated().map { (index, element) in
            element ^ cipher[index]
        }
        return String(bytes: decryptedArray, encoding: .utf8)
    }
        
    public static func decrypt(file fileName: String, in bundle: Bundle, using key: String) -> String? {
        guard let url = bundle.url(forResource: fileName, withExtension: nil), let data = try? Data(contentsOf: url) else {
            return nil
        }
        return decrypt(data: data, using: key)
    }
    
}
