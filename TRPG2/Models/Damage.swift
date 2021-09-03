//
//  Damage.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/18.
//

import Foundation

struct Damage: Codable {
    // adb + c
    let a: Int
    let b: Int
    let c: Int
    
    var description: String {"\(a)d\(b) + \(c)"}
}
