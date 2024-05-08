//
//  yumemicodingApp.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/01.
//

import SwiftUI

@main
struct yumemicodingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @EnvironmentObject var sceneDelegate: SceneDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: MyProfile.self)
    }
}
