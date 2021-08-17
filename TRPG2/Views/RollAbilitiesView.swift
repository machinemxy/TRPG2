//
//  RollAbilitiesView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/16.
//

import SwiftUI

struct RollAbilitiesView: View {
    @Binding var isNewGame: Bool
    @ObservedObject private var caoCao = Creature()
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(
                    destination: CaoCaoIntroView(),
                    label: {
                        Text(caoCao.name)
                            .fontWeight(.bold)
                    })
                KeyValueView(key: "Strength:", value: "\(caoCao.str)")
                KeyValueView(key: "Dexterity", value: "\(caoCao.dex)")
                KeyValueView(key: "Constitution", value: "\(caoCao.con)")
                KeyValueView(key: "Intelligence", value: "\(caoCao.int)")
                KeyValueView(key: "Wisdom", value: "\(caoCao.wis)")
                KeyValueView(key: "Charisma", value: "\(caoCao.cha)")
                Button("Roll") {
                    rollAbilities()
                }
                Button("Confirm") {
                    withAnimation {
                        isNewGame = false
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
        caoCao.cha = array[0]
        caoCao.int = array[1]
        caoCao.wis = array[2]
        caoCao.str = array[3]
        caoCao.dex = array[4]
        caoCao.con = array[5]
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
        RollAbilitiesView(isNewGame: .constant(true))
    }
}
