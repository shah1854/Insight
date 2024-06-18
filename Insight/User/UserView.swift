//
//  UserView.swift
//  Insight
//
//  Created by Mihir Shah on 6/17/24.
//

import SwiftUI

struct UserView: View {
    @StateObject private var viewModel = UserViewModel()
    @Binding var showSignIn: Bool
    
    var body: some View {
        NavigationStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .padding()
            
            
            Button (action: {
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
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
        UserView(showSignIn: .constant(false))
    }
}
