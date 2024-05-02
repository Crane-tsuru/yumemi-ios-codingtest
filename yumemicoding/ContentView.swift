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
            NavigationLink(destination: EmptyView()) {
                Capsule()
                    .frame(width: 200, height: 100)
                    .foregroundStyle(.purple.gradient)
                    .cornerRadius(10)
                    .overlay(Text("占う").font(.largeTitle).foregroundStyle(.white))
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

