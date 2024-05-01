//
//  ContentView.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            NavigationLink(destination: ExampleView()) {
//                Rectangle()
//                    .frame(width: 200, height: 100)
//                    .foregroundStyle(.purple.gradient)
//                    .cornerRadius(10)
//                    .overlay(Text("占う").font(.title).foregroundStyle(.white))
//            }
            
            NavigationLink {
                ExampleView()
            } label: {
                Rectangle()
                    .frame(width: 200, height: 100)
                    .foregroundStyle(.purple.gradient)
                    .cornerRadius(10)
                    .overlay(Text("占う").font(.title).foregroundStyle(.white))
            }
        }
        .padding()
    }
}

struct ExampleView: View {
    var body: some View {
        VStack {
            Text("navigation")
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ExampleView()
}
