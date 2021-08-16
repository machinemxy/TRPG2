//
//  KeyValueView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/16.
//

import SwiftUI

struct KeyValueView: View {
    let key: String
    let value: String
    
    var body: some View {
        HStack {
            Text(key)
            Spacer()
            Text(value)
        }
    }
}

struct KeyValueView_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueView(key: "Name:", value: "Cao Cao")
    }
}
