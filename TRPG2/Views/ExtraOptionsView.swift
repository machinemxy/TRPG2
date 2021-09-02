//
//  ExtraOptionsView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/09/02.
//

import SwiftUI

struct ExtraOptionsView: View {
    @EnvironmentObject var pc: Pc
    @EnvironmentObject var gameData: GameData
    @State private var showRestartAlert = false
    
    var body: some View {
        Form {
            Button(action: {
                showRestartAlert = true
            }, label: {
                Text("Restart game")
                    .foregroundColor(.red)
            })
            .alert(isPresented: $showRestartAlert, content: {
                Alert(
                    title: Text("Warning"),
                    message: Text("This opeartion will delete your save data. Are you sure?"),
                    primaryButton: .destructive(Text("OK"), action: {
                    restart()
                }),
                    secondaryButton: .cancel())
            })
            
            Text(LongText.announcement)
                .font(.footnote)
            
            Text(LongText.openGameLicense)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .navigationTitle("Extra Options")
    }
    
    private func restart() {
        let newPc = Pc()
        let newGameData = GameData()
        _ = FileManager.default.save(newPc, to: .pc)
        _ = FileManager.default.save(newGameData, to: .gameData)
        pc.copy(from: newPc)
        gameData.copy(from: newGameData)
        UserDefaults.standard.setValue(true, forKey: UserDefaultsKey.isNewGame)
    }
}

struct ExtraOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExtraOptionsView()
                .environmentObject(Pc())
                .environmentObject(GameData())
        }
    }
}
