//
//  WeaponView.swift
//  TRPG2
//
//  Created by Ma, Xueyuan | MTSD on 2021/09/10.
//

import SwiftUI

struct WeaponView: View {
	@EnvironmentObject var pc: Pc
	
    var body: some View {
		Form {
			Section(header: Text("Current")) {
				KeyValueView(key: pc.weapon.name, value: pc.weapon.damage.description)
			}
			
			Section(header: Text("Reserve")) {
				ForEach(pc.uneWeapons) { weapon in
					Button(action: {
						swapWeapon(to: weapon)
					}, label: {
						KeyValueView(key: weapon.name, value: weapon.damage.description)
					})
				}
			}
		}
		.navigationTitle("Weapon")
    }
	
	private func swapWeapon(to newWeapon: Weapon) {
		pc.uneWeapons.append(pc.weapon)
		pc.weapon = newWeapon
		pc.uneWeapons.removeAll { $0.id == newWeapon.id }
	}
}

struct WeaponView_Previews: PreviewProvider {
    static var previews: some View {
		let pc = Pc()
		pc.uneWeapons.append(Weapon(id: 1, name: "long sword", damage: Damage(a: 1, b: 10, c: 0), hb: 0))
		
		return NavigationView {
			WeaponView()
				.environmentObject(pc)
		}
    }
}
