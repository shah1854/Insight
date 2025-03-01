//
//  ContentView.swift
//  Insight
//
//  Created by Mihir Shah on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSignIn: Bool = false
    @StateObject private var viewModel = MainViewModel()
    var body: some View {
        ZStack {
            if viewModel.isSignedin, !viewModel.currUserID.isEmpty {
                MainView(showSignIn: false)
            } else {
                LoginFields()
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
