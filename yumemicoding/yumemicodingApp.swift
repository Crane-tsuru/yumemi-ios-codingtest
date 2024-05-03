//
//  yumemicodingApp.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/01.
//

import SwiftUI
import SwiftData

@main
struct yumemicodingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: MyStatus.self)
    }
}
