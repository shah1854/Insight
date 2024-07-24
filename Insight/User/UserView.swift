//
//  UserView.swift
//  Insight
//
//  Created by Mihir Shah on 6/17/24.
//

import SwiftUI

struct UserView: View {
    @StateObject private var viewModel = UserViewModel()
    @State var showSignIn = false
    
    var body: some View {
        NavigationStack {
            if showSignIn {
                MainView(showSignIn: true)
            } else {
                mainView
            }
        }
    }

    var mainView: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .padding()
            
            Button(action: {
                Task {
                    do {
                        try viewModel.logOut()
                        showSignIn = true
                    } catch {
                        print(error)
                    }
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                        .frame(height: 55)
                        .padding()
                    Text("Log Out")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
            })
            .navigationTitle("User Profile")
        }
    }
}


#Preview {
    NavigationStack {
        UserView()
    }
}
