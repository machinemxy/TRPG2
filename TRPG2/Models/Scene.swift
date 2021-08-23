//
//  Scene.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/23.
//

import Foundation

struct Scene {
    let sceneType: SceneType
    let sceneName: String
}

enum SceneType {
    case normal
    case check
    case battle
}
 
