//
//  LoadingView.swift
//  GameClickerApp
//
//  Created by Vladuslav on 15.10.2025.
//

import SwiftUI

struct LoadingView: View {
    @State private var index = 0
    var body: some View {

            VStack{
                ZStack{
                    Image("background")
                        .resizable()
                        .frame(width: .infinity, height: 300)
                        .cornerRadius(40)
                        .padding()
                        .ignoresSafeArea()
                    Image("knightR_\(index)")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .onAppear{
                            Timer.scheduledTimer(withTimeInterval: 0.12, repeats: true){_ in
                                index = index % 8 + 1
                            }
                        }
                        .offset(x: -10, y: 100)
                }
                
                Text("Loading")
                    .font(.custom("Press Start 2P", size: 12))

            }
            .frame(height: 550)
    }
}

#Preview {
    LoadingView()
}
