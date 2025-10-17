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
    var body: some View {
            GeometryReader{ geo in
                VStack(spacing: 0){
                    if let scene{
                        SpriteView(scene: scene)
                            .frame(height: geo.size.height * 0.7)
                            .ignoresSafeArea()
                    }
                    Color.gray
                        .frame(height: geo.size.height * 0.5)
                        .ignoresSafeArea()
                }
                .ignoresSafeArea()
            }
        .onAppear{
            if scene == nil{
                let newScene = TownScene()
                newScene.scaleMode = .resizeFill
                scene = newScene
            }
        }
    }
}

#Preview {
    TownView()
}
