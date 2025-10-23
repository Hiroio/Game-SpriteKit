//
//  CampView.swift
//  GameClickerApp
//
//  Created by Vladuslav on 23.10.2025.
//

import SwiftUI
import SpriteKit

struct CampView: View {
    @State private var scene: CampScene? = nil
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("TileWall")
                    .resizable(resizingMode: .tile)
                    .ignoresSafeArea()

                
            }
            if let scene{
                SpriteView(scene: scene)
                    .frame(height: geo.size.height * 0.7)
                    .ignoresSafeArea()
            }
            
            
        }
        .onAppear{
            if scene == nil{
                let newScene = CampScene()
                newScene.scaleMode = .resizeFill
                scene = newScene
            }
        }
    }
}

#Preview {
    CampView()
}
