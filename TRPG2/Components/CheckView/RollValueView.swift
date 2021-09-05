//
//  RollValueView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/09/04.
//

import SwiftUI

struct RollValueView: View {
    @Binding var rollValue: Int?
    
    var body: some View {
        HStack {
            Text("Roll value")
            Spacer()
            if let rollValue = rollValue {
                Text("\(rollValue)")
            } else {
                Button("Roll") {
                    rollValue = Int.random(in: 1...20)
                }
            }
        }
    }
}

struct RollValueView_Previews: PreviewProvider {
    static var previews: some View {
        RollValueView(rollValue: .constant(nil))
    }
}
