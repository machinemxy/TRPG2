//
//  NormalView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/24.
//

import SwiftUI

struct NormalView: View {
    @EnvironmentObject var pc: Pc
    @EnvironmentObject var gameData: GameData
    let normalScenes: Dictionary<String, NormalScene>
    
    var scene: NormalScene {
        normalScenes[gameData.subSceneName] ?? NormalScene.fallBack
    }
    
    var visibleChoices: [Choice] {
        scene.choices.filter { choice in
            guard let appearCondition = choice.appearCondition else { return true }
            return gameData.variables[appearCondition.variable] == appearCondition.value
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: true, content: {
                    Text(scene.detail)
                        .font(.footnote)
                        .padding()
                    
                    ForEach(visibleChoices) { choice in
                        ChoiceView(choice: choice)
                            .padding(.horizontal)
                    }
                })
                
                Spacer()
            }
            .navigationTitle(scene.name)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NormalView_Previews: PreviewProvider {
    static var previews: some View {
        NormalView(normalScenes: Bundle.main.load(from: "outOfPalace_normal")!)
            .environmentObject(Pc())
            .environmentObject(GameData())
    }
}
