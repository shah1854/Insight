//
//  ContentView.swift
//  Insight
//
//  Created by Mihir Shah on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSignIn: Bool = false
    var body: some View {
        ZStack {
            NavigationStack  {
                if showSignIn {
                    LoginFields()
                } else {
                    MainView()
                }
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getUser()
            self.showSignIn = authUser == nil
            print("logged in user UID: \(String(describing: authUser?.uid))")
        }
//        .fullScreenCover(isPresented: $showSignIn) {
//            NavigationStack {
//                LoginFields()
//            }
//        }
//        MainView(showSignIn: $showSignIn)
    }
}

#Preview {
    ContentView()
}
