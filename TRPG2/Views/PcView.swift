//
//  PcView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/09/03.
//

import SwiftUI

struct PcView: View {
    @EnvironmentObject var pc: Pc
    
    var body: some View {
        Form {
            Section(header: Text("Basic")) {
                HStack {
                    Text("Level")
                    Spacer()
                    Text("\(pc.lv)")
                    Button("Level up") {
                        print("level up!")
                    }.disabled(pc.exp < pc.requiredExp)
                }
                KeyValueView(key: "Exp", value: String(numerator: pc.exp, denominator: pc.requiredExp))
                KeyValueView(key: "HP", value: String(numerator: pc.hp, denominator: pc.mhp))
            }
            
            Section(header: Text("Abilities")) {
                KeyValueView(key: "Strength", value: "\(pc.str)")
                KeyValueView(key: "Dexterity", value: "\(pc.dex)")
                KeyValueView(key: "Constitution", value: "\(pc.con)")
                KeyValueView(key: "Intelligence", value: "\(pc.int)")
                KeyValueView(key: "Wisdom", value: "\(pc.wis)")
                KeyValueView(key: "Charisma", value: "\(pc.cha)")
            }
            
            Section(header: Text("Equipment")) {
                KeyValueView(key: "Weapon", value: pc.weapon?.name ?? "fist")
                KeyValueView(key: "Shield", value: pc.shield?.name ?? "unequipped")
                KeyValueView(key: "Armor", value: pc.armor?.name ?? "unequipped")
            }
            
            Section(header: Text("Combat")) {
                KeyValueView(key: "Hit bonus", value: "\(pc.hb)")
                KeyValueView(key: "Damage", value: pc.damage.description)
                KeyValueView(key: "Armor class", value: "\(pc.ac)")
            }
            
            Section(header: Text("Passive Skills")) {
                ForEach(pc.ps, id: \.self) { ps in
                    VStack(alignment: .leading) {
                        Text(ps.rawValue)
                        Text(ps.description).font(.footnote)
                    }
                }
            }
        }
        .navigationTitle(pc.name)
    }
}

struct PcView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PcView()
                .environmentObject(Pc())
        }
    }
}
