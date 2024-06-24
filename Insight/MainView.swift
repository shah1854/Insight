//
//  MainView.swift
//  Insight
//
//  Created by Mihir Shah on 6/17/24.
//

import SwiftUI

struct MainView: View {
    @State private var selection: Tab = .feed
    
    enum Tab {
        case feed
        case profile
    }
    @Binding var showSignIn: Bool
    var body: some View {
        TabView(selection: $selection) {
            HomeFeedView()
                .tabItem {
                    Image(systemName: "square.3.layers.3d")
                    Text("Feed")
                }
                .tag(Tab.feed)
            
            UserView(showSignIn: $showSignIn)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .tag(Tab.profile)
        }
    }
}

#Preview {
    MainView(showSignIn: .constant(true))
}
