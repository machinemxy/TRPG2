//
//  CaoCaoIntroView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/17.
//

import SwiftUI

struct CaoCaoIntroView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            Text(LongText.caoCaoIntro)
            .padding()
        })
        .navigationTitle("Cao Cao")
    }
}

struct CaoCaoIntroView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CaoCaoIntroView()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
