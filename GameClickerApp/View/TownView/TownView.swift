//
//  TownView.swift
//  GameClickerApp
//
//  Created by Vladuslav on 16.10.2025.
//

import SwiftUI
import SpriteKit

struct TownView: View {
    @State private var scene: TownScene? = nil
    @State private var controller: TownController = TownController()
    var body: some View {
            GeometryReader{ geo in
                VStack(spacing: 0){
                    if let scene{
                        SpriteView(scene: scene)
                            .frame(height: geo.size.height * 0.7)
                            .ignoresSafeArea()
                    }
                    ZStack{
                        Image("TileWall")
                            .resizable(resizingMode: .tile)
                            .ignoresSafeArea()
                        VStack(spacing: 0){
                            HStack{
                                ZStack{
                                    Image("TopBarDecoration")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: .infinity, height: 60)
                                    Image("ForestIcon")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .offset(y: -30)
                                }
                            }
                            .offset(y: -20)
                            
                            HStack(alignment: .firstTextBaseline){
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.gray)
                                    .frame(width: 80, height: 80)
                                    ZStack(alignment: .topLeading){
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.gray)
                                            .frame(height: 80)
                                        Text("HELLO WORLD...")
                                            .font(.custom("Press Start 2P", size: 12))
                                            .padding()
                                    }
                                
                            }
                            .padding(.horizontal)
                            Spacer()
                            HStack{
                                Image(controller.bottomState.icon)
                                    .resizable()
                                    .frame(width: 70, height: 60)
                                    .offset(y: -20)
                                
                                
                            }
                        }
                        
                    }
                    .ignoresSafeArea()
                    .frame(height: geo.size.height * 0.4)
                }
                .ignoresSafeArea()
            }
        .onAppear{
            if scene == nil{
                let newScene = TownScene()
                newScene.scaleMode = .resizeFill
                newScene.controller = controller
                scene = newScene
            }
        }
    }
}

#Preview {
    TownView()
}
