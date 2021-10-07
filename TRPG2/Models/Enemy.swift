//
//  Enemy.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/10/07.
//

import Foundation

struct Enemy: Creature, Codable {
    var name: String
    var str: Int
    var dex: Int
    var con: Int
    var int: Int
    var wis: Int
    var cha: Int
    var mhp: Int
    var hp: Int
    var hb: Int
    var damage: Damage
    var ac: Int
}
