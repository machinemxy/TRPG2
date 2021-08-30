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
            Text(
"""
You are a young general of Dynasty Han. When the Yellow Turban Rebellion broke out in 184, you led your army and suppressed the rebel.

You are not only a brave warrior, great leader in the battle field, but also not refusing using tricks to deceive your enemies. Politician Xu Shao commented on you as \"a capable minister in times of peace, but a great villian in times of chaos\".

Now Dynasty Han is facing another crisis. General Dong Zhuo seized control of the dynasty by holding yong empiror Liu Bian as hostage. What will you react in this situation?
"""
            )
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
