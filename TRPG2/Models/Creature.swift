//
//  Creature.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/16.
//

import Foundation

class Creature: ObservableObject {
    @Published var name = "Cao Cao"
    @Published var str = 10
    @Published var dex = 10
    @Published var con = 10
    @Published var int = 10
    @Published var wis = 10
    @Published var cha = 10
}
