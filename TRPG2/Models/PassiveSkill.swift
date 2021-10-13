//
//  PassiveSkill.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/19.
//

import Foundation

enum PassiveSkill: String, Codable {
    case persuasion = "Persuasion"
    
    var description: String {
        switch self {
        case .persuasion:
            return "When you perform persuasion, you'll get proficiency bonus."
        }
    }
}
