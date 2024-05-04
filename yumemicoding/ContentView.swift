//
//  ContentView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/01.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            NavigationLink(destination: SelectNameFortuneView()) {
                Capsule()
                .frame(width: 200, height: 100)
                .foregroundStyle(.purple.gradient)
                .cornerRadius(10)
                .overlay(Text("占う").font(.largeTitle).foregroundStyle(.white))
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
    }
}

#Preview {
    ContentView()
}

