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
            NavigationStack {
                MainView(showSignIn: $showSignIn)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getUser()
            self.showSignIn = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignIn) {
            NavigationStack {
                LoginFields()
            }
        }
    }
}

#Preview {
    ContentView()
}
