//
//  RollAbilitiesView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/16.
//

import SwiftUI

struct RollAbilitiesView: View {
    @ObservedObject var pc: Pc
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(
                    destination: CaoCaoIntroView(),
                    label: {
                        Text("Cao Cao")
                            .fontWeight(.bold)
                    })
                KeyValueView(key: "Strength:", value: "\(pc.str)")
                KeyValueView(key: "Dexterity", value: "\(pc.dex)")
                KeyValueView(key: "Constitution", value: "\(pc.con)")
                KeyValueView(key: "Intelligence", value: "\(pc.int)")
                KeyValueView(key: "Wisdom", value: "\(pc.wis)")
                KeyValueView(key: "Charisma", value: "\(pc.cha)")
                Button("Roll") {
                    rollAbilities()
                }
                Button("Confirm") {
                    withAnimation {
                        pc.name = "Cao Cao"
                    }
                }
            }
            .navigationTitle("Abilities Roll")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func rollAbilities() {
        var array = [Int]()
        for _ in 1...6 {
            let rollResult = rollAbility()
            array.append(rollResult)
        }
        array.sort { $0 > $1 }
        pc.cha = array[0]
        pc.int = array[1]
        pc.wis = array[2]
        pc.str = array[3]
        pc.dex = array[4]
        pc.con = array[5]
    }
    
    private func rollAbility() -> Int {
        var array = [Int]()
        for _ in 1...4 {
            array.append(Int.random(in: 1...6))
        }
        array.sort { $0 > $1 }
        return array[0] + array[1] + array[2]
    }
}

struct RollAbilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        RollAbilitiesView(pc: Pc())
    }
}
