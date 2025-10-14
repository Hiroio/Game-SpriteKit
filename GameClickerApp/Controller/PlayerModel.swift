//
//  PlayerModel.swift
//  GameClickerApp
//
//  Created by Vladuslav on 15.10.2025.
//

import SwiftUI
import Observation

@Observable
class PlayerModel {
    var name: String = ""
    var hp: Int = 100
    let totalHP = 100
    var attack = 10
    var critChance = 0
    var money = 0

    
}
