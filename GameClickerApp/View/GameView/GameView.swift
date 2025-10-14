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
            if let scene{
                SpriteView(scene: scene)
                .ignoresSafeArea()
            }
            VStack{
                TopStatsPannel(enemy: enemyModel)
                Spacer()
            }
            if enemyModel.isDead{
                LootPopUp(newEnemy: scene?.NextEnemy ?? {print("Fail")})
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
