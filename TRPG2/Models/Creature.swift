//
//  Creature.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/18.
//

import Foundation

protocol Creature {
    var name: String { get }
    var str: Int { get }
    var dex: Int { get }
    var con: Int { get }
    var int: Int { get }
    var wis: Int { get }
    var cha: Int { get }
    var mhp: Int { get }
    var hp: Int { get set }
    var hb: Int { get }
    var damage: Damage { get }
    var ac: Int { get }
}
