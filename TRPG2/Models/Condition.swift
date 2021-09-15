//
//  Condition.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/23.
//

import Foundation

struct Condition: Codable {
    let id: Int
    let value: Int
}

/* Use this space to record each variable's meaning
 --------------------------------------------------
 id 0: If brave minister is alive or dead.
 value 0: Alive
 value 1: Dead
 value 2: Left
 --------------------------------------------------
 id 1: If talked to Wang Yun.
 value 0: Not talked
 value 1: Talked
 --------------------------------------------------
 id 2: If got long sword
 value 0: Not got
 value 1: Got
 --------------------------------------------------
 id 3: If got leather armor
 value 0: Not got
 value 1: Got
 --------------------------------------------------
 */
