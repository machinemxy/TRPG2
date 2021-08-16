//
//  RollAbilitiesView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/16.
//

import SwiftUI

struct RollAbilitiesView: View {
    private var caoCao = Cha(name: "Cao Cao", str: 10, dex: 10, con: 10, int: 10, wis: 10, cha: 10)
    
    var body: some View {
        NavigationView {
            Form {
                KeyValueView(key: "Name:", value: caoCao.name)
                KeyValueView(key: "Strength:", value: "\(caoCao.str)")
                KeyValueView(key: "Dexterity", value: "\(caoCao.dex)")
                KeyValueView(key: "Constitution", value: "\(caoCao.con)")
                KeyValueView(key: "Intelligence", value: "\(caoCao.int)")
                KeyValueView(key: "Wisdom", value: "\(caoCao.wis)")
                KeyValueView(key: "Charisma", value: "\(caoCao.cha)")
            }
            .navigationTitle("Abilities Roll")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct RollAbilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        RollAbilitiesView()
    }
}
