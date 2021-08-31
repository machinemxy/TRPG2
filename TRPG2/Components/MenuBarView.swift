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
    @State private var isSaveCompleted = false
    
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
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
                
            }, label: {
                Image(systemName: "square.and.arrow.up")
                    .font(.largeTitle)
            })
            
            Button(action: {
                
            }, label: {
                Image(systemName: "ellipsis.circle")
                    .font(.largeTitle)
            })
        }
    }
    
    private func save() {
        let error = FileManager.default.save(pc, to: .pc)
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        let error2 = FileManager.default.save(gameData, to: .gameData)
        if let error2 = error2 {
            print(error2.localizedDescription)
            return
        }
        
        isSaveCompleted = true
    }
}

struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView()
            .environmentObject(Pc())
            .environmentObject(GameData())
    }
}
