//
//  Weapon.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/18.
//

import Foundation

struct Weapon: Codable {
    let name: String
    let damage: Damage
    let hb: Int
    
    static let fist = Weapon(name: "fist", damage: Damage(a: 1, b: 2, c: 0), hb: 0)
}
