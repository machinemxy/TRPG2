//
//  GameData.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/21.
//

import Foundation


class GameData: ObservableObject {
    @Published var scene = Scene(sceneType: .normal, sceneName: NormalSceneName.outOfPalace)
    @Published var variables = Array.init(repeating: 0, count: 100)
}
