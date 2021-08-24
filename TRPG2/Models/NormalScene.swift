//
//  NormalScene.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/23.
//

import Foundation

struct NormalScene: Codable {
    let name: String
    let detail: String
    let choices: [Choice]
    
    static let fallBack = NormalScene(name: "Error", detail: "Invalid normal scene.", choices: [])
}
