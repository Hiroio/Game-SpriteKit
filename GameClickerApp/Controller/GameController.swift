//
//  GameController.swift
//  GameClickerApp
//
//  Created by Vladuslav on 05.10.2025.
//

import SwiftUI

@Observable
class GameController {
    enum SceneType {
        case mainMenu
        case town
        case battle
    }

    var currentScene: SceneType = .mainMenu
    var playerModel = PlayerModel()
    var enemyModel = EnemyModel()
    
    func loadScene(_ type: SceneType) {
        currentScene = type
    }
}
