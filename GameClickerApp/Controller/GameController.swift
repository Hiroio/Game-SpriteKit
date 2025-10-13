//
//  GameController.swift
//  GameClickerApp
//
//  Created by Vladuslav on 05.10.2025.
//

import Foundation


func generateRandomEnemy() -> EnemyModel {
    let enemies = ["Goblin"]
    let randomName = enemies.randomElement() ?? "Goblin"
    let randomHP = Int.random(in: 50...200)
    
    let enemy = EnemyModel()
    enemy.name = randomName
    enemy.hp = randomHP
    return enemy
}
