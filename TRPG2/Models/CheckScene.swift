//
//  CheckScene.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/09/04.
//

import Foundation

struct CheckScene: Codable {
    let checkType: CheckType
    let targetValue: Int
    let whenSucceed: Destination
    let whenFail: Destination
    let isSecret: Bool
    
    static let fallBack = CheckScene(checkType: .persuasion, targetValue: 15, whenSucceed: Destination.gameOver, whenFail: Destination.gameOver, isSecret: true)
}

enum CheckType: String, Codable {
    case persuasion
    
    var checkViewTitle: String {
        switch self {
        case .persuasion:
            return "Persuasion Check"
        }
    }
    
    var abilityBonusText: String {
        switch self {
        case .persuasion:
            return "Charisma bonus"
        }
    }
}
