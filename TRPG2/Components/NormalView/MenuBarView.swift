//
//  MenuBarView.swift
//  TRPG2
//
//  Created by Ma Xueyuan on 2021/08/31.
//

import SwiftUI

struct MenuBarView: View {
    @EnvironmentObject var pc: Pc
    @EnvironmentObject var gameData: GameData
    @State private var saveText = ""
    @State private var isSaveCompleted = false
    @State private var isLoadCompleted = false
    
    var body: some View {
        HStack {
            NavigationLink(
                destination: PcView(),
                label: {
                    Image(systemName: "person.circle")
                        .font(.largeTitle)
                })
            
            Button(action: {
                
            }, label: {
                Image(systemName: "bag.circle")
                    .font(.largeTitle)
            })
            
            Button(action: {
                save()
            }, label: {
                Image(systemName: "square.and.arrow.down")
                    .font(.largeTitle)
            })
            .alert(isPresented: $isSaveCompleted, content: {
                Alert(title: Text("Save Completed!"))
            })
            
            Button(action: {
                load()
            }, label: {
                Image(systemName: "square.and.arrow.up")
                    .font(.largeTitle)
            })
            .alert(isPresented: $isLoadCompleted, content: {
                Alert(title: Text("Load Completed!"))
            })
            
            
            NavigationLink(
                destination: ExtraOptionsView(),
                label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.largeTitle)
                })
        }
    }
    
    private func save() {
        let error = FileManager.default.save(pc, to: .pc)
        if let error = error {
            print(error.localizedDescription)
            saveText = "Save Failed!"
            isSaveCompleted = true
            return
        }
        
        let error2 = FileManager.default.save(gameData, to: .gameData)
        if let error2 = error2 {
            print(error2.localizedDescription)
            saveText = "Save Failed!"
            isSaveCompleted = true
            return
        }
        
        saveText = "Save Completed!"
        isSaveCompleted = true
    }
    
    private func load() {
        let loadedPc = FileManager.default.load(from: .pc) ?? Pc()
        let loadedGameData = FileManager.default.load(from: .gameData) ?? GameData()
        pc.copy(from: loadedPc)
        gameData.copy(from: loadedGameData)
        isLoadCompleted = true
    }
}

struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView()
            .environmentObject(Pc())
            .environmentObject(GameData())
    }
}
