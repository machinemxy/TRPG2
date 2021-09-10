//
//  WeaponLinkView.swift
//  TRPG2
//
//  Created by Ma, Xueyuan | MTSD on 2021/09/10.
//

import SwiftUI

struct WeaponLinkView: View {
	var weapon: Weapon
	
    var body: some View {
		NavigationLink(
			destination: WeaponView(),
			label: {
				HStack {
					Text("Weapon")
					Spacer()
					Text(weapon.name)
				}
			})
		
    }
}

struct WeaponLinkView_Previews: PreviewProvider {
    static var previews: some View {
		WeaponLinkView(weapon: Weapon.unequipped)
    }
}