//
//  LootPopUp.swift
//  GameClickerApp
//
//  Created by Vladuslav on 13.10.2025.
//

import SwiftUI

struct LootPopUp: View {
    var body: some View {
        ZStack{
            Image("PaperTile")
                .resizable()
                .scaledToFit()

            VStack(spacing: 20){
                HStack(spacing: 0){
                    Image("Ribbon_2")
                        .resizable()
                        .frame(width: 80, height: 30)
                        .offset(x: 30)
                    ZStack{
                        Image("Ribbon_1")
                            .resizable()
                            .frame(width: 100, height: 40)
                        Text("Loot")
                            .font(.custom("Press Start 2P", size: 12))
                            .foregroundStyle(.white)
                    }
                    .zIndex(3.0)
                    Image("Ribbon_2")
                        .resizable()
                        .frame(width: 80, height: 30)
                        .offset(x: -30)
                }
                .padding(.top, 40)
                
                
                VStack{
                    ForEach(1...3, id: \.self){i in
                        HStack{
                            ZStack{
                                Image("SquareTile")
                                Image( i % 2 == 0 ? "GoblinEar" : "Coin")
                            }
                            Text(i % 2 == 0 ? "Goblin Ear" : "Coin")
                                .font(.custom("Press Start 2P", size: 10))
                            Spacer()
                            Text(i % 2 == 0 ? "x1" : "\(Int.random(in: 200...1000))")
                                .font(.custom("Press Start 2P", size: 20))
                                .foregroundStyle(.yellow.mix(with: .black, by: 0.3))
                        }
                        .frame(width: 200)
                    }
                }
                
                HStack{
                    Image("AcceptBtn")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Image("DeclineBtn")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                Spacer()
            }
            
        }
        .frame(height: 350)
    }
}

#Preview {
    LootPopUp()
}
