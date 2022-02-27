//
//  github_client_appApp.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import SwiftUI
import Firebase

@main
struct github_client_appApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                UserList()
                    .environmentObject(RemoteConfigManager())
            }
        }
    }
    
    final class AppDelegate: UIResponder, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            // Firebaseの初期化.
            FirebaseApp.configure()
            
            return true
        }
    }
}
