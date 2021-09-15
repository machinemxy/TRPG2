//
//  ChoiceView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/24.
//

import SwiftUI

struct ChoiceView: View {
    @EnvironmentObject var pc: Pc
    @EnvironmentObject var gameData: GameData
    let choice: Choice
    
    var imageName: String {
        switch choice.choiceType {
        case .person:
            return "person"
        case .object:
            return "cube"
        case .action:
            return "figure.walk"
        case .place:
            return "house"
        case .rest:
            return "bed.double"
        }
    }
    
    var body: some View {
        HStack {
            Button(action: {
                if let variableChange = choice.variableChange {
                    gameData.variables[variableChange.id] = variableChange.value
                }
                
                if let expChange = choice.expChange {
                    pc.exp += expChange
                }
                
                if let weapon = choice.getWeapon {
                    pc.uneWeapons.append(weapon)
                }
				
				if let armor = choice.getArmor {
					pc.uneArmors.append(armor)
				}
                
                if choice.choiceType == .rest {
                    pc.hp = pc.mhp
                }
                
                let destination = choice.destination
                if let subSceneName = destination.subSceneName {
                    gameData.subSceneName = subSceneName
                }
                if let sceneName = destination.sceneName {
                    gameData.sceneName = sceneName
                }
                if let sceneType = destination.sceneType {
                    gameData.sceneType = sceneType
                }
            }, label: {
                Image(systemName: imageName)
                Text(choice.name)
            })
            Spacer()
        }
    }
}

struct ChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceView(choice: Choice.example)
            .environmentObject(Pc())
            .environmentObject(GameData())
    }
}
