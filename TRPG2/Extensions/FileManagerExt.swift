//
//  FileManagerExt.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/21.
//

import Foundation

enum FileName: String {
    case pc
    case gameData
}

extension FileManager {
    func load<T: Codable>(from fileName: FileName) -> T? {
        let url = getDocumentsDirectory().appendingPathComponent(fileName.rawValue)

        guard let data = try? Data(contentsOf: url) else {
            print("Cannnot find file \(fileName.rawValue).")
            return nil
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            print("Failed to decode \(fileName.rawValue).")
            return nil
        }
        
        return loaded
    }
    
    func save<T: Codable>(_ t: T, to fileName: FileName) -> Error? {
        let encoder = JSONEncoder()
        let url = getDocumentsDirectory().appendingPathComponent(fileName.rawValue)
        
        do {
            let encoded = try encoder.encode(t)
            try encoded.write(to: url, options: [.atomicWrite, .completeFileProtection])
        } catch {
            return error
        }
        
        return nil
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = self.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
