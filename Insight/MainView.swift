//
//  MainView.swift
//  Insight
//
//  Created by Mihir Shah on 6/17/24.
//

import SwiftUI

struct MainView: View {
    @Binding var showSignIn: Bool
    var body: some View {
        TabView {
            HomeFeedView()
                .tabItem {
                    Image(systemName: "square.3.layers.3d")
                    Text("Feed")
                }
            UserView(showSignIn: $showSignIn)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    MainView(showSignIn: .constant(true))
}
