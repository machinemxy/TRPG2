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
    
    var scene: NormalScene {
		gameData.normalScenes[gameData.subSceneName] ?? NormalScene.fallBack
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
					VStack(alignment: .leading, spacing: 8, content: {
                        HStack {
                            Text(scene.detail)
                                .font(.footnote)
                                .padding(.horizontal)
                            Spacer()
                        }
						
						ForEach(visibleChoices) { choice in
							ChoiceView(choice: choice)
								.padding(.horizontal)
						}
					})
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
        NormalView()
            .environmentObject(Pc())
            .environmentObject(GameData())
    }
}
