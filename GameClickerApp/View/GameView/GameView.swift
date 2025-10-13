//
//  GameView.swift
//  GameClickerApp
//
//  Created by Vladuslav on 05.10.2025.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    @State private var enemyModel: EnemyModel = EnemyModel()
    @State private var scene: GameScene? = nil
    var body: some View {
        ZStack{
            SpriteView(scene: {
                let scene = GameScene(enemyModel: enemyModel)
                scene.scaleMode = .resizeFill
                return scene
            }())
            .ignoresSafeArea()
            
            VStack{
                TopStatsPannel(enemy: enemyModel)
                Spacer()
                Button{enemyModel.reset()}label:{
                    Text("Reset")
                    
                }
            }
            if enemyModel.isDead{
                LootPopUp()
            }
        }
        .onAppear{
            if scene == nil{
                let newScene = GameScene(enemyModel: enemyModel)
                newScene.scaleMode = .resizeFill
                scene = newScene
            }
        }
    }
}

#Preview {
    GameView()
}
