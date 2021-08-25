//
//  TRPG2App.swift
//  TRPG2
//
//  Created by 馬学渊 on 2021/01/10.
//

import SwiftUI

@main
struct TRPG2App: App {
    @AppStorage(UserDefaultsKey.isNewGame) private var isNewGame = true
    @ObservedObject private var pc = FileManager.default.load(from: .pc) ?? Pc()
    @ObservedObject private var gameData = FileManager.default.load(from: .gameData) ?? GameData()
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            if isNewGame {
                RollAbilitiesView(isNewGame: $isNewGame)
                    .environmentObject(pc)
            } else if gameData.sceneType == .normal {
                NormalView()
                    .environmentObject(gameData)
            }
        }
    }
}
