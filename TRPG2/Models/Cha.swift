//
//  Cha.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/16.
//

import Foundation

class Cha {
    internal init(name: String, str: Int, dex: Int, con: Int, int: Int, wis: Int, cha: Int) {
        self.name = name
        self.str = str
        self.dex = dex
        self.con = con
        self.int = int
        self.wis = wis
        self.cha = cha
    }
    
    var name: String
    var str: Int
    var dex: Int
    var con: Int
    var int: Int
    var wis: Int
    var cha: Int
}
