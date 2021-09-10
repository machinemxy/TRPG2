//
//  ArmorView.swift
//  TRPG2
//
//  Created by Ma, Xueyuan | MTSD on 2021/09/10.
//

import SwiftUI

struct ArmorView: View {
	@EnvironmentObject var pc: Pc
	
    var body: some View {
		Form {
			Section(header: Text("Current")) {
				KeyValueView(key: pc.armor.name, value: "\(pc.armor.ac)")
			}
			
			Section(header: Text("Reserve")) {
				ForEach(pc.uneArmors) { armor in
					Button(action: {
						swapArmor(to: armor)
					}, label: {
						KeyValueView(key: armor.name, value: "\(armor.ac)")
					})
				}
			}
		}
		.navigationTitle("Armor")
    }
	
	private func swapArmor(to newArmor: Armor) {
		pc.uneArmors.append(pc.armor)
		pc.armor = newArmor
		pc.uneArmors.removeAll { $0.id == newArmor.id }
	}
}

struct ArmorView_Previews: PreviewProvider {
    static var previews: some View {
		let pc = Pc()
		pc.uneArmors.append(Armor(id: 1, name: "leather armor", ac: 1))
		
		return NavigationView {
			ArmorView()
				.environmentObject(pc)
		}
    }
}
