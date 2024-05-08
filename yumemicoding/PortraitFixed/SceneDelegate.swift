//
//  SceneDelegate.swift
//  yumemicoding
//
//  Created by 鶴見駿 on 2024/05/08.
//

import SwiftUI

final class SceneDelegate: NSObject, ObservableObject, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        self.window = windowScene.keyWindow
    }
}
