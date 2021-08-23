//
//  NormalSceneSelector.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/23.
//

import Foundation

struct NormalSceneSelector {
    static func get(_ name: String) -> NormalScene {
        switch name {
        case NormalSceneName.outOfPalace:
            return NormalScene(
                name: "Out of Palace",
                detail: "The road to the Palace. Some ministers gather here to exchange their ideas.",
                choices: [
                    Choice(choiceType: .person, name: "minister", destination: Scene(sceneType: .normal, sceneName: NormalSceneName.minister), appearCondition: nil)
                ]
            )
        default:
            return NormalScene(
                name: "Game Over",
                detail: "Please reload save data or restart the game.",
                choices: []
            )
        }
    }
}
