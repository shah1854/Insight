//
//  InsightApp.swift
//  Insight
//
//  Created by Mihir Shah on 6/11/24.
//

import SwiftUI
import FirebaseCore

@main
struct InsightApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
//                .transition(.opacity)
//                .animation(.easeOut(duration: 1.5))
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
