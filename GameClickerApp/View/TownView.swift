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
                        VStack{
                            HStack{
                                Image("ForestIcon")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            }.offset(y: -75)
                            Spacer()
                            HStack{
                                Image(controller.bottomState.icon)
                                    .resizable()
                                    .frame(width: 70, height: 60)
                            }.offset(y: -30)
                        }
                        .frame(height: geo.size.height * 0.4)
                        
                    }.frame(height: geo.size.height * 0.5)
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
