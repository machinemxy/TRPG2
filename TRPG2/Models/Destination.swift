//
//  Destination.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/23.
//

import Foundation

struct Destination: Codable {
    let sceneType: SceneType?
    let sceneName: String?
    let subSceneName: String?
    
    static let gameOver = Destination(sceneType: .normal, sceneName: "gameOver", subSceneName: "gameOver")
}

enum SceneType: String, Codable {
    case normal
    case check
    case battle
}
