//
//  BundleExt.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/24.
//

import Foundation

extension Bundle {
    func load<T: Codable>(from fileName: String) -> T? {
        guard let url = url(forResource: fileName, withExtension: "json") else { return nil }

        guard let data = try? Data(contentsOf: url) else {
            print("File \(fileName) does not exist.")
            return nil
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            print("Failed to decode \(fileName).")
            return nil
        }
        
        print("loaded \(fileName)")
        return loaded
    }
}
