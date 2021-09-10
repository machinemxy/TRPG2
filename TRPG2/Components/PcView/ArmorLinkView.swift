//
//  ArmorLinkView.swift
//  TRPG2
//
//  Created by Ma, Xueyuan | MTSD on 2021/09/10.
//

import SwiftUI

struct ArmorLinkView: View {
	let armor: Armor
	
    var body: some View {
		NavigationLink(
			destination: ArmorView(),
			label: {
				HStack {
					Text("Armor")
					Spacer()
					Text(armor.name)
				}
			})
    }
}

struct ArmorLinkView_Previews: PreviewProvider {
    static var previews: some View {
		ArmorLinkView(armor: Armor.unequipped)
    }
}
