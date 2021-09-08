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
    let variableChange: Condition?
    let expChange: Int?
    
    var id: String { name }
    
    static let example = Choice(choiceType: .action, name: "Back", destination: Destination(sceneType: nil, sceneName: nil, subSceneName: "outOfPalace"), appearCondition: nil, variableChange: nil, expChange: nil)
}

enum ChoiceType: String, Codable {
    case person
    case object
    case action
    case place
    case rest
}
