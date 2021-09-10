//
//  Armor.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/18.
//

import Foundation

struct Armor: Codable, Identifiable {
	let id: Int
    let name: String
    let ac: Int
	
	static let unequipped = Armor(id: 0, name: "unequipped", ac: 0)
}
