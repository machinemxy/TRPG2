//
//  FinalValueView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/09/05.
//

import SwiftUI

struct FinalValueView: View {
    var finalValue: Int?
    
    var body: some View {
        HStack {
            Text("Final value")
                .bold()
            Spacer()
            if let finalValue = finalValue {
                Text("\(finalValue)").bold()
            }
        }
    }
}

struct FinalValueView_Previews: PreviewProvider {
    static var previews: some View {
        FinalValueView(finalValue: nil)
    }
}
