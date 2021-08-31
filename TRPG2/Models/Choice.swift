//
//  Choice.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/23.
//

import Foundation

struct Choice: Codable, Identifiable {
    let choiceType: ChoiceType
    let name: String
    let destination: Destination
    let appearCondition: Condition?
    let changeCondition: Condition?
    
    var id: String { name }
    
    static let example = Choice(choiceType: .action, name: "Back", destination: Destination(sceneType: nil, sceneName: nil, subSceneName: "outOfPalace"), appearCondition: nil, changeCondition: nil)
}

enum ChoiceType: String, Codable {
    case person
    case object
    case action
}
