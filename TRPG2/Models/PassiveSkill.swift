//
//  PassiveSkill.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/19.
//

import Foundation

enum PassiveSkill: String, Codable {
    case persuation = "Persuation"
    
    var description: String {
        switch self {
        case .persuation:
            return "When you perform persuation, you'll get proficiency bonus."
        }
    }
}
