//
//  TRPG2App.swift
//  TRPG2
//
//  Created by 馬学渊 on 2021/01/10.
//

import SwiftUI

@main
struct TRPG2App: App {
    @ObservedObject private var pc = FileManager.default.load(from: .pc) ?? Pc()
    
    var body: some Scene {
        WindowGroup {
            if pc.name.isEmpty {
                RollAbilitiesView(pc: pc)
            } else {
                Text("fuck")
            }
        }
    }
}
