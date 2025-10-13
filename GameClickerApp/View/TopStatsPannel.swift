//
//  TopStatsPannel.swift
//  GameClickerApp
//
//  Created by Vladuslav on 05.10.2025.
//

import SwiftUI

struct TopStatsPannel: View {
    @Bindable var enemy: EnemyModel
    var body: some View {
        VStack(spacing: 55){
            HStack{
                //                GOLD BAR
                HStack{
                    Text("100")
                    Image("GoldOre")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(5)
                
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.black.mix(with: .red, by: 0.5))
                )
                Spacer()
                //                LVL nAME
                Text("UserName")
                    .foregroundStyle(.black)
                Text("1 lvl.")
                Spacer()
                //                Energy
                HStack{
                    Text("10")
                    Image("Lightning")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(5)
                
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.black.mix(with: .green, by: 0.5))
                )
            }
            .padding(.horizontal, 5)
            .font(.custom("Press Start 2P", size: 14))
            
            //        Enemy indicators
            VStack(spacing: 0){
                Text(enemy.name)
                    .font(.custom("Press Start 2P", size: 20))
                HStack{
                    Image("Heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                    ProgressView(value: Double(enemy.hp), total: Double(enemy.totalHP))
                        .progressViewStyle(.linear)
                        .tint(.red)
                        .frame(width: 200, height: 5)
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.black.mix(with: .gray, by: 0.9))
                        )
                    Text("\(enemy.hp)/\(enemy.totalHP)")
                        .font(.custom("Press Start 2P", size: 12))
                        .foregroundStyle(.red)
                }
            }
        }
    }
}


