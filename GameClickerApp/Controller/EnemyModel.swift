//
//  EnemyModel.swift
//  GameClickerApp
//
//  Created by Vladuslav on 08.10.2025.
//
import SwiftUI
import Observation

@Observable
class EnemyModel {
    let enemies: [String] = ["Goblin"]
    var name: String = "Goblin"
    var hp: Int = 100
    let totalHP = 100
    var isDead: Bool = false
    
    func takeHit(amount: Int) {
        hp -= amount
        if hp <= 0 {
            hp = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                withAnimation(.easeIn){
                    self.isDead = true
                }
            }
        }
        
    }
    
    
    func resetEnemy() {
        name = enemies.randomElement()!
        hp = 100
        withAnimation(.easeOut){
            isDead = false
        }
    }
}
