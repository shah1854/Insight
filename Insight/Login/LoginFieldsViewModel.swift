//
//  LoginFieldsViewModel.swift
//  Insight
//
//  Created by Mihir Shah on 6/17/24.
//

import Foundation
@MainActor
class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    //@TODO: add password validation
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No Email or Password found")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
