//
//  CheckView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/09/04.
//

import SwiftUI

struct CheckView: View {
    @EnvironmentObject var pc: Pc
    @EnvironmentObject var gameData: GameData
    @State private var rollValue: Int?
    
    var scene: CheckScene {
        gameData.checkScenes[gameData.subSceneName] ?? CheckScene.fallBack
    }
    
    var abilityBonus: Int {
        switch scene.checkType {
        case .persuasion:
            return pc.cha.modifier
        }
    }
    
    var proficiencyBonus: Int {
        switch scene.checkType {
        case .persuasion:
            if pc.ps.contains(.persuasion) {
                return pc.proficiency
            } else {
                return 0
            }
        }
    }
    
    var finalValue: Int? {
        guard let rollValue = rollValue else { return nil }
        return abilityBonus + proficiencyBonus + rollValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                if scene.isSecret {
                    KeyValueView(key: "Target", value: "?")
                } else {
                    KeyValueView(key: "Target", value: "\(scene.targetValue)")
                }
                KeyValueView(key: scene.checkType.abilityBonusText, value: "\(abilityBonus)")
                KeyValueView(key: "Proficiency bonus", value: "\(proficiencyBonus)")
                RollValueView(rollValue: $rollValue)
                FinalValueView(finalValue: finalValue)
                if let finalValue = finalValue {
                    if finalValue >= scene.targetValue {
                        if !scene.isSecret {
                            Text("Check succeeded!")
                                .foregroundColor(.green)
                        }
                        Button("Continue") {
                            goto(destination: scene.whenSucceed)
                        }
                    } else {
                        if !scene.isSecret {
                            Text("Check failed!")
                                .foregroundColor(.red)
                        }
                        Button("Continue") {
                            goto(destination: scene.whenFail)
                        }
                    }
                }
            }
            .navigationTitle(scene.checkType.checkViewTitle)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func goto(destination: Destination) {
        if let subSceneName = destination.subSceneName {
            gameData.subSceneName = subSceneName
        }
        if let sceneName = destination.sceneName {
            gameData.sceneName = sceneName
        }
        if let sceneType = destination.sceneType {
            gameData.sceneType = sceneType
        }
    }
}

struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView()
            .environmentObject(Pc())
            .environmentObject(GameData())
    }
}
