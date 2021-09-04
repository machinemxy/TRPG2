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
    
    static let fallBack = CheckScene(checkType: .persuation, targetValue: 15, whenSucceed: Destination.gameOver, whenFail: Destination.gameOver, isSecret: true)
}

enum CheckType: String, Codable {
    case persuation
    
    var checkViewTitle: String {
        switch self {
        case .persuation:
            return "Persuation Check"
        }
    }
    
    var abilityBonusText: String {
        switch self {
        case .persuation:
            return "Charisma bonus"
        }
    }
}
