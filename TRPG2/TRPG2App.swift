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
    
    var body: some Scene {
        WindowGroup {
            if isNewGame {
                RollAbilitiesView()
            } else {
                Text("fuck")
            }
        }
    }
}
