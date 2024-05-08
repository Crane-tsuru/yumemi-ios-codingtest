//
//  ContentView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/01.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @EnvironmentObject var sceneDelegate: SceneDelegate
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            NavigationLink(destination: SelectNameFortuneView()) {
                Capsule()
                .frame(width: 200, height: 100)
                .foregroundStyle((colorScheme == .dark) ? .blue : .purple)
                .cornerRadius(10)
                .overlay(Text("占う")
                    .font(.largeTitle).foregroundStyle(.white))
            }
            .padding()
            
            
            NavigationLink(destination: ProfileListView()) {
                Label("プロフィール設定", systemImage: "gearshape")
            }
            .padding()
            .scaleEffect(1.2)
            
            Spacer()
        }
        .padding()
        .onAppear(perform: {
            if let window = sceneDelegate.window {
                // 画面の向きを.portraitでロック
                OrientationController.shared.lockOrientation(to: .portrait, onWindow: window)
            }
        })
    }
}

#Preview {
    HomeView()
        .modelContainer(for: MyProfile.self)
        .environmentObject(SceneDelegate())
}

