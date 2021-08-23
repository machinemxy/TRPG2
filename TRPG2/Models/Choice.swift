//
//  Choice.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/23.
//

import Foundation

struct Choice {
    let choiceType: ChoiceType
    let name: String
    let destination: Scene
    let appearCondition: AppearCondition?
}

enum ChoiceType {
    case person
    case object
    case action
}
