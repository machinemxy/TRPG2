//
//  Weapon.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/18.
//

import Foundation

struct Weapon: Codable, Identifiable {
	let id: Int
    let name: String
    let damage: Damage
    let hb: Int
    
	static let unequipped = Weapon(id: 0, name: "unequipped", damage: Damage(a: 1, b: 2, c: 0), hb: 0)
}
