//
//  BattleView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/10/07.
//

import SwiftUI

struct BattleView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Mouse HP 8/8")
            Image("mouse")
                .resizable()
                .frame(width: 300, height: 300)
                .background(Color.white)
            Spacer()
            Text("Cao Cao attack, mouse lost 5 HP.\nMouse attack, Cao Cao lost 1 HP.")
            Text("Cao Cao HP 8/8")
            Button("Attack") {
                
            }
        }
    }
}

struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView()
            .preferredColorScheme(.dark)
    }
}
