//
//  TownController.swift
//  GameClickerApp
//
//  Created by Vladuslav on 16.10.2025.
//
import SwiftUI

enum TownState{
    case idle
    case shop
    case quest
    case healer
    
    var icon: String{
        switch self{
            case .idle: return ""
            case .shop: return "Coin"
            case .quest: return "QuestListIcon"
            case .healer: return "ChurchIcon"
        }
    }
}

@Observable
class TownController {
    var bottomState: TownState = .idle
    
    
    func changeState(to newState: TownState) {
        withAnimation(.easeInOut(duration: 0.3)) {
            self.bottomState = newState
        }
    }
}
