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
    var name: String = "Goblin"
    var hp: Int = 100
    let totalHP = 100
    var isDead: Bool = false
    
    func takeHit(amount: Int) {
        hp -= amount
        if hp <= 0 {
            hp = 0
            isDead = true
        }
        
    }
    
    
    func reset() {
        hp = 100
        isDead = false
    }
}
