//
//  Pc.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/16.
//

import Foundation

class Pc: ObservableObject, Creature, Codable {
    // MARK: properties
    @Published var name = "Cao Cao"
    @Published var str = 10
    @Published var dex = 10
    @Published var con = 10
    @Published var int = 10
    @Published var wis = 10
    @Published var cha = 10
    @Published var lv = 1
    @Published var exp = 0
    @Published var hp = 10
    @Published var mhp = 10
    @Published var weapon: Weapon?
    @Published var shield: Shield?
    @Published var armor: Armor?
    @Published var ps: [PassiveSkill] = [.persuation]
    @Published var money = 0
    
    // MARK: codable
    enum Ck: CodingKey {
        case name, str, dex, con, int, wis, cha, lv, exp, hp, mhp, weapon, shield, armor, ps, money
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Ck.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(str, forKey: .str)
        try container.encode(dex, forKey: .dex)
        try container.encode(con, forKey: .con)
        try container.encode(int, forKey: .int)
        try container.encode(wis, forKey: .wis)
        try container.encode(cha, forKey: .cha)
        try container.encode(lv, forKey: .lv)
        try container.encode(exp, forKey: .exp)
        try container.encode(hp, forKey: .hp)
        try container.encode(mhp, forKey: .mhp)
        try container.encode(weapon, forKey: .weapon)
        try container.encode(shield, forKey: .shield)
        try container.encode(armor, forKey: .armor)
        try container.encode(ps, forKey: .ps)
        try container.encode(money, forKey: .money)
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Ck.self)
        
        name = try container.decode(String.self, forKey: .name)
        str = try container.decode(Int.self, forKey: .str)
        dex = try container.decode(Int.self, forKey: .dex)
        con = try container.decode(Int.self, forKey: .con)
        int = try container.decode(Int.self, forKey: .int)
        wis = try container.decode(Int.self, forKey: .wis)
        cha = try container.decode(Int.self, forKey: .cha)
        lv = try container.decode(Int.self, forKey: .lv)
        exp = try container.decode(Int.self, forKey: .exp)
        hp = try container.decode(Int.self, forKey: .hp)
        mhp = try container.decode(Int.self, forKey: .mhp)
        weapon = try container.decodeIfPresent(Weapon.self, forKey: .weapon)
        shield = try container.decodeIfPresent(Shield.self, forKey: .shield)
        armor = try container.decodeIfPresent(Armor.self, forKey: .armor)
        ps = try container.decode([PassiveSkill].self, forKey: .ps)
        money = try container.decode(Int.self, forKey: .money)
    }
    
    // MARK: calculated properties
    var proficiency: Int { (lv - 1) / 4 + 2 }
    
    var hb: Int {
        // hit bonus = strMod + proficiency + weaponHb
        let wrappedWeapon = weapon ?? Weapon.fist
        return str.modifier + proficiency + wrappedWeapon.hb
    }
    
    var damage: Damage {
        let wrappedWeapon = weapon ?? Weapon.fist
        let wd = wrappedWeapon.damage
        return Damage(a: wd.a, b: wd.b, c: wd.c + str.modifier)
    }
    
    var ac: Int {
        // armor class = 10 + dexMod + shieldAc + armorAc
        return 10 + dex.modifier + (shield?.ac ?? 0) + (armor?.ac ?? 0)
    }
}