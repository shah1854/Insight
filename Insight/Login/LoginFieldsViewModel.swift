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
    
    func signIn() -> Bool {
        guard !email.isEmpty, !password.isEmpty else {
            print("No Email or Password found")
            return false
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.login(email: email, password: password)
                print("Successful Login")
                print(returnedUserData)
                return true
            } catch {
                print("Error: \(error)")
                return false
            }
        }
        return false
    }
}
